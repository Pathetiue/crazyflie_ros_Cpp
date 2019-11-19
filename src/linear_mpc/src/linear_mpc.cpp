#include <linear_mpc/linear_mpc.h>

constexpr int LinearModelPredictiveController::kStateSize;
constexpr int LinearModelPredictiveController::kInputSize;
constexpr int LinearModelPredictiveController::kMeasurementSize;
constexpr double LinearModelPredictiveController::kGravity;
constexpr int LinearModelPredictiveController::kPredictionHorizonSteps;

void QuaternionToEulerAngles(
    const Eigen::Quaterniond& quaternion, Eigen::Vector3d* euler_angles)
{
    double w = quaternion.w();
    double x = quaternion.x();
    double y = quaternion.y();
    double z = quaternion.z();

    // roll (x-axis rotation)
    double sinr_cosp = +2.0 * (w * x + y * z);
    double cosr_cosp = +1.0 - 2.0 * (x * x + y * y);
    euler_angles->x() = atan2(sinr_cosp, cosr_cosp);

    // pitch (y-axis rotation)
    double sinp = +2.0 * (w * y - z * x);
    if (fabs(sinp) >= 1)
        euler_angles->y() = copysign(M_PI / 2, sinp); // use 90 degrees if out of range
    else
        euler_angles->y() = asin(sinp);

    // yaw (z-axis rotation)
    double siny_cosp = +2.0 * (w * z + x * y);
    double cosy_cosp = +1.0 - 2.0 * (y * y + z * z);
    euler_angles->z() = atan2(siny_cosp, cosy_cosp);
}

LinearModelPredictiveController::LinearModelPredictiveController(
    const ros::NodeHandle& nh, const ros::NodeHandle& private_nh)
    : nh_(nh)
    , private_nh_(private_nh)
    , dyn_config_server_(private_nh)
    , initialized_parameters_(false)
    , verbose_(false)
    , solve_time_average_(0.0)
    , received_desired_pose_(false)
    , last_position_(0, 0, 0)
{
    dynamic_reconfigure::Server<linear_mpc::LinearMPCConfig>::CallbackType f;
    f = boost::bind(&LinearModelPredictiveController::DynConfigCallback, this, _1, _2);
    dyn_config_server_.setCallback(f);

    pose_sub_ = nh_.subscribe(
        "/pose", 1, &LinearModelPredictiveController::poseCallback, this);

    cmd_roll_pitch_yawrate_thrust_pub_ = nh_.advertise<mav_msgs::RollPitchYawrateThrust>(
        "/cmd_attitude_thrust", 1);

    set_pose_server_ = nh_.advertiseService(
        "/set_pose", &LinearModelPredictiveController::setPose, this);

    initializeParameters();

    publish_timer_ = nh_.createTimer(ros::Duration(publish_time_), &LinearModelPredictiveController::cmdPublisher, this);
}

LinearModelPredictiveController::~LinearModelPredictiveController()
{

}

void LinearModelPredictiveController::initializeParameters()
{
    std::vector<double> drag_coefficients;
    
    //Get parameters from RosParam server
    private_nh_.param<bool>("verbose", verbose_, false);

    if (!private_nh_.getParam("mass", mass_)) {
        ROS_ERROR("mass in MPC is not loaded from ros parameter server");
        abort();
    }

    if (!private_nh_.getParam("drag_coefficients", drag_coefficients)) {
        ROS_ERROR("drag_coefficients in MPC is not loaded from ros parameter server");
        abort();
    }
    drag_coefficients_ << drag_coefficients.at(0), drag_coefficients.at(1), drag_coefficients.at(2);

    //if (!private_nh_.getParam("prediction_sampling_time", prediction_sampling_time_)) {
    //    ROS_ERROR("prediction_sampling_time in MPC is not loaded from ros parameter server");
    //    abort();
    //}

    if (!private_nh_.getParam("sampling_time", sampling_time_)) {
        ROS_ERROR("sampling_time in MPC is not loaded from ros parameter server");
        abort();
    }

    if (!private_nh_.getParam("publish_time", publish_time_)) {
        ROS_ERROR("sampling_time in MPC is not loaded from ros parameter server");
        abort();
    }

    //construct model matrices
    //Eigen::MatrixXd A_continous_time(kStateSize, kStateSize);
    //A_continous_time = Eigen::MatrixXd::Zero(kStateSize, kStateSize);
    //Eigen::MatrixXd B_continous_time;
    //B_continous_time = Eigen::MatrixXd::Zero(kStateSize, kInputSize);

    //A_continous_time(0, 3) = 1;
    //A_continous_time(1, 4) = 1;
    //A_continous_time(2, 5) = 1;
    //A_continous_time(3, 3) = -drag_coefficients.at(0);
    //A_continous_time(4, 4) = -drag_coefficients.at(1);
    //A_continous_time(5, 5) = -drag_coefficients.at(2);

    //B_continous_time(5, 2) = 1.0;
    //B_continous_time(3, 1) = kGravity;
    //B_continous_time(4, 0) = -kGravity;

    //model_A_ = (prediction_sampling_time_ * A_continous_time).exp();

    //Eigen::MatrixXd integral_exp_A;
    //integral_exp_A = Eigen::MatrixXd::Zero(kStateSize, kStateSize);
    //const int count_integral_A = 100;

    //for (int i = 0; i < count_integral_A; i++) {
    //    integral_exp_A += (A_continous_time * prediction_sampling_time_ * i / count_integral_A).exp()
    //    * prediction_sampling_time_ / count_integral_A;
    //}

    //model_B_ = integral_exp_A * B_continous_time;

    model_A_ = Eigen::MatrixXd::Zero(kStateSize, kStateSize);
    model_B_ = Eigen::MatrixXd::Zero(kStateSize, kInputSize);

    model_A_(0, 0) = 1;
    model_A_(0, 3) = 0.05;
    model_A_(1, 1) = 1;
    model_A_(1, 4) = 0.05;
    model_A_(2, 2) = 1;
    model_A_(2, 5) = 0.05;
    model_A_(3, 3) = 1;
    model_A_(4, 4) = 1;
    model_A_(5, 5) = 1;

    model_B_(0, 1) = 0.01225;
    model_B_(1, 0) = -0.01225;
    model_B_(2, 2) = 0.00125;
    model_B_(3, 1) = 0.49;
    model_B_(4, 0) = -0.49;
    model_B_(5, 2) = 0.05;

    if (verbose_) {
        ROS_INFO_STREAM("A: \n" << model_A_);
        ROS_INFO_STREAM("B: \n" << model_B_);
    }

    //Solver initialization
    set_defaults();
    setup_indexing();

    //Solver settings
    settings.verbose = 0;

    Eigen::Map<Eigen::MatrixXd>(const_cast<double*>(params.A), kStateSize, kStateSize) = model_A_;
    Eigen::Map<Eigen::MatrixXd>(const_cast<double*>(params.B), kStateSize, kInputSize) = model_B_;

    initialized_parameters_ = true;
    ROS_INFO("Linear MPC: initialized correctly");
}

void LinearModelPredictiveController::DynConfigCallback(
    linear_mpc::LinearMPCConfig &config, uint32_t level)
{
    q_position_ << config.q_x, config.q_y, config.q_z;
    q_velocity_ << config.q_vx, config.q_vy, config.q_vz;

    q_final_position_ << config.q_final_x, config.q_final_y, config.q_final_y;
    q_final_velocity_ << config.q_final_vx, config.q_final_vy, config.q_final_vz;

    r_command_ << config.r_roll, config.r_pitch, config.r_thrust;

    roll_limit_ = config.roll_max;
    pitch_limit_ = config.pitch_max;
    thrust_max_ = config.thrust_max - kGravity;
    thrust_min_ = config.thrust_min - kGravity;

    applyParameters();
}

void LinearModelPredictiveController::applyParameters()
{
    Eigen::Matrix<double, kStateSize, kStateSize> Q;
    Q.setZero();
    Eigen::Matrix<double, kStateSize, kStateSize> Q_final;
    Q_final.setZero();
    Eigen::Matrix<double, kInputSize, kInputSize> R;
    R.setZero();

    Q.block(0, 0, 3, 3) = q_position_.asDiagonal();
    Q.block(3, 3, 3, 3) = q_velocity_.asDiagonal();
    R = r_command_.asDiagonal();

    //Compute terminal cost
    //Q_final(k+1) = A'*Q_final(k)*A - (A'*Q_final(k)*B)*inv(B'*Q_final(k)*B+R)*(B'*Q_final(k)*A)+ Q;
    //Q_final = Q;
    //for (int i = 0; i < 1000; i++) {
    //    Eigen::MatrixXd temp = (model_B_.transpose() * Q_final * model_B_ + R);
    //    Q_final = model_A_.transpose() * Q_final * model_A_ 
    //        - (model_A_.transpose() * Q_final * model_B_) * temp.inverse()
    //        * (model_B_.transpose() * Q_final * model_A_) + Q;
    //}
    Q_final.block(0, 0, 3, 3) = q_final_position_.asDiagonal();
    Q_final.block(3, 3, 3, 3) = q_final_velocity_.asDiagonal();

    Eigen::MatrixXd temporary_matrix = model_B_.transpose() * Q_final * model_B_ + R;
    LQR_K_ = temporary_matrix.inverse() * (model_B_.transpose() * Q_final * model_A_);

    Eigen::Map<Eigen::MatrixXd>(const_cast<double*>(params.Q), kStateSize, kStateSize) = Q;
    Eigen::Map<Eigen::MatrixXd>(const_cast<double*>(params.Q_final), kStateSize, kStateSize) = Q_final;
    Eigen::Map<Eigen::MatrixXd>(const_cast<double*>(params.R), kInputSize, kInputSize) = R;

    params.u_max[0] = roll_limit_;
    params.u_max[1] = pitch_limit_;
    params.u_max[2] = thrust_max_;
    
    params.u_min[0] = -roll_limit_;
    params.u_min[1] = -pitch_limit_;
    params.u_min[2] = thrust_min_;

    ROS_INFO("Linear MPC: Tuning parameters updated...");
    if (verbose_) {
        ROS_INFO_STREAM("diag(Q) = \n" << Q.diagonal().transpose());
        ROS_INFO_STREAM("diag(R) = \n" << R.diagonal().transpose());
        ROS_INFO_STREAM("Q_final = \n" << Q_final);
    }
}

void LinearModelPredictiveController::poseCallback(
    const geometry_msgs::PoseStamped::ConstPtr& pose_msg)
{
    if(!received_desired_pose_)
    {
        return;
    }

    pose_ = pose_msg->pose;

    calculateRollPitchYawrateThrustCommand();
}

void LinearModelPredictiveController::cmdPublisher(
    const ros::TimerEvent& time_event)
{
    cmd_roll_pitch_yawrate_thrust_pub_.publish(cmd_roll_pitch_yawrate_thrust_);
}

void LinearModelPredictiveController::calculateRollPitchYawrateThrustCommand()
{
    assert(initialized_parameters_ == true);
    ros::WallTime starting_time = ros::WallTime::now();

    Eigen::Matrix<double, kStateSize, 1> x_0;
    Eigen::Vector3d velocity_world;

    //Eigen::Vector3d current_rpy;
    //Eigen::Quaterniond current_quaternion(
    //    pose_.orientation.w, 
    //    pose_.orientation.x, 
    //    pose_.orientation.y, 
    //    pose_.orientation.z);
    //QuaternionToEulerAngles(current_quaternion, &current_rpy);
    //double roll = current_rpy(0);
    //double pitch = current_rpy(1);
    //double yaw = current_rpy(2);

    double xdot = (pose_.position.x - last_position_.x()) / sampling_time_;
    double ydot = (pose_.position.y - last_position_.y()) / sampling_time_;
    double zdot = (pose_.position.z - last_position_.z()) / sampling_time_;

    x_0 << pose_.position.x, pose_.position.y, pose_.position.z, xdot, ydot, zdot;

    Eigen::Map<Eigen::Matrix<double, kStateSize, 1>>(const_cast<double*>(params.x_0)) = x_0;

    tic();
    int solver_status = solve();
    solve_time_average_ += tocq();

    linearized_command_roll_pitch_thrust_ << vars.u_0[0], vars.u_0[1], vars.u_0[2];

    if (solver_status < 0) {
        ROS_WARN("Linear MPC: Solver faild, use LQR backup");
        linearized_command_roll_pitch_thrust_ = LQR_K_ * (x_d_ - x_0);
        linearized_command_roll_pitch_thrust_ = linearized_command_roll_pitch_thrust_.cwiseMax(
            Eigen::Vector3d(-roll_limit_, -pitch_limit_, thrust_min_));
        linearized_command_roll_pitch_thrust_ = linearized_command_roll_pitch_thrust_.cwiseMin(
            Eigen::Vector3d(roll_limit_, pitch_limit_, thrust_max_));
    }

    //cmd_roll_pitch_yawrate_thrust_.thrust.z = 
    //    (linearized_command_roll_pitch_thrust_(2) + kGravity) / (cos(roll) * cos(pitch));
    //double ux = 
    //    linearized_command_roll_pitch_thrust_(1) * (kGravity / cmd_roll_pitch_yawrate_thrust_.thrust.z);
    //double uy = 
    //    linearized_command_roll_pitch_thrust_(0) * (kGravity / cmd_roll_pitch_yawrate_thrust_.thrust.z);
    
    //cmd_roll_pitch_yawrate_thrust_.roll = ux * sin(yaw) + uy * cos(yaw);
    //cmd_roll_pitch_yawrate_thrust_.pitch = ux * cos(yaw) - uy * sin(yaw);
    cmd_roll_pitch_yawrate_thrust_.roll = linearized_command_roll_pitch_thrust_(0);
    cmd_roll_pitch_yawrate_thrust_.pitch = linearized_command_roll_pitch_thrust_(1);
    cmd_roll_pitch_yawrate_thrust_.yaw_rate = 0;
    cmd_roll_pitch_yawrate_thrust_.thrust.x = 0;
    cmd_roll_pitch_yawrate_thrust_.thrust.y = 0;
    //cmd_roll_pitch_yawrate_thrust_.thrust.z *= mass_;
    cmd_roll_pitch_yawrate_thrust_.thrust.z = (linearized_command_roll_pitch_thrust_(2) + kGravity) * mass_;

    last_position_ << pose_.position.x, pose_.position.y, pose_.position.z;

    double diff_time = (ros::WallTime::now() - starting_time).toSec();

    if (verbose_) {
        static int counter = 0;
        if (counter > 100) {
            ROS_INFO_STREAM("average solve time: " << 1000.0 * solve_time_average_ / counter << " ms");
            solve_time_average_ = 0.0;
            
            ROS_INFO_STREAM("Controller loop time : " << diff_time * 1000.0 << " ms");
            
            ROS_INFO_STREAM("roll ref: " << cmd_roll_pitch_yawrate_thrust_.roll
                << "\t" << "pitch ref : \t" << cmd_roll_pitch_yawrate_thrust_.pitch
                << "\t" << "yawrate ref : \t" << cmd_roll_pitch_yawrate_thrust_.yaw_rate
                << "\t" << "thrust ref : \t" << cmd_roll_pitch_yawrate_thrust_.thrust.z);
            counter = 0;
        }
        counter++;
    }
}

bool LinearModelPredictiveController::setPose(
    linear_mpc::SetPose::Request& req_set_pose, 
    linear_mpc::SetPose::Response& res_set_pose)
{
    ROS_INFO_STREAM("Desired pose requested");

    x_d_ << req_set_pose.pose.position.x, req_set_pose.pose.position.y, 
        req_set_pose.pose.position.z, 0, 0, 0;
    
    Eigen::Map<Eigen::Matrix<double, kStateSize, 1>>(const_cast<double*>(params.x_d)) = x_d_;

    if (verbose_) {
        ROS_INFO_STREAM("desired pose: \n" << req_set_pose.pose);
    }
    received_desired_pose_ = true;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "LinearModelPredictiveControllerNode");
    ros::NodeHandle nh, private_nh("~");

    LinearModelPredictiveController mpc(nh, private_nh);

    ros::spin();

    return 0;
}