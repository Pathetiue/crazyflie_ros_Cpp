#ifndef LINEAR_MPC_NODE_H
#define LINEAR_MPC_NODE_H

#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <mav_msgs/RollPitchYawrateThrust.h>
#include <std_msgs/Time.h>
#include <linear_mpc/SetPose.h>
#include <std_msgs/UInt16.h>

#include <dynamic_reconfigure/server.h>
#include <linear_mpc/LinearMPCConfig.h>

#include <Eigen/Eigen>
#include <unsupported/Eigen/MatrixFunctions>

#include <solver.h>

class LinearModelPredictiveController
{
    public:
    LinearModelPredictiveController(const ros::NodeHandle& nh, const ros::NodeHandle& private_nh);
    ~LinearModelPredictiveController();

    private:

    // constants
    static constexpr int kStateSize = 6;
    static constexpr int kInputSize = 3;
    static constexpr int kMeasurementSize = 6;
    static constexpr int kPredictionHorizonSteps = 20;
    static constexpr double kGravity = 9.8066;

    // ros node handles
    ros::NodeHandle nh_, private_nh_;

    // publishers
    double publish_time_;
    ros::Timer publish_timer_;
    ros::Publisher cmd_roll_pitch_yawrate_thrust_pub_;
    void cmdPublisher(const ros::TimerEvent& time_event);

    // subscribers
    ros::Subscriber pose_sub_;
    void poseCallback(const geometry_msgs::PoseStamped::ConstPtr& pose_msg);

    // service servers
    ros::ServiceServer set_pose_server_;
    bool setPose(
        linear_mpc::SetPose::Request& req_set_pose, 
        linear_mpc::SetPose::Response& res_set_pose);


    //initialize parameters
    void initializeParameters();
    bool initialized_parameters_;

    // sampling time parameters
    double sampling_time_;
    double prediction_sampling_time_;

    // system model parameters
    // Model: A, B
    // x(k+1) = A*x(k) + B*u(k)
    Eigen::Matrix<double, kStateSize, kStateSize> model_A_;   //dynamics matrix
    Eigen::Matrix<double, kStateSize, kInputSize> model_B_;   //transfer matrix
    Eigen::Vector3d drag_coefficients_;
    double mass_;

    // dynamic configure server
    dynamic_reconfigure::Server<linear_mpc::LinearMPCConfig> dyn_config_server_;
    void DynConfigCallback(linear_mpc::LinearMPCConfig& config, uint32_t level);

    // controller parameters
    // state penalty
    Eigen::Vector3d q_position_;
    Eigen::Vector3d q_velocity_;

    Eigen::Vector3d q_final_position_;
    Eigen::Vector3d q_final_velocity_;

    // control penalty
    Eigen::Vector3d r_command_;

    // control input limits
    double roll_limit_;
    double pitch_limit_;
    double yaw_rate_limit_;
    double thrust_min_;
    double thrust_max_;

    // debug info
    bool verbose_;
    double solve_time_average_;

    // backup LQR
    Eigen::MatrixXd LQR_K_;

    // most recent pose information
    geometry_msgs::Pose pose_;

    // last pose information
    Eigen::Vector3d last_position_;

    // desired goal information
    bool received_desired_pose_;
    Eigen::Matrix<double, kStateSize, 1> x_d_;

    // controller output
    Eigen::Vector3d linearized_command_roll_pitch_thrust_;
    mav_msgs::RollPitchYawrateThrust cmd_roll_pitch_yawrate_thrust_;
    
    void applyParameters();

    void calculateRollPitchYawrateThrustCommand();
};

#endif