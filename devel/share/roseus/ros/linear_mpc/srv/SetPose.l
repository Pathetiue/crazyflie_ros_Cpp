;; Auto-generated. Do not edit!


(when (boundp 'linear_mpc::SetPose)
  (if (not (find-package "LINEAR_MPC"))
    (make-package "LINEAR_MPC"))
  (shadow 'SetPose (find-package "LINEAR_MPC")))
(unless (find-package "LINEAR_MPC::SETPOSE")
  (make-package "LINEAR_MPC::SETPOSE"))
(unless (find-package "LINEAR_MPC::SETPOSEREQUEST")
  (make-package "LINEAR_MPC::SETPOSEREQUEST"))
(unless (find-package "LINEAR_MPC::SETPOSERESPONSE")
  (make-package "LINEAR_MPC::SETPOSERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass linear_mpc::SetPoseRequest
  :super ros::object
  :slots (_pose ))

(defmethod linear_mpc::SetPoseRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass linear_mpc::SetPoseResponse
  :super ros::object
  :slots ())

(defmethod linear_mpc::SetPoseResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass linear_mpc::SetPose
  :super ros::object
  :slots ())

(setf (get linear_mpc::SetPose :md5sum-) "f192399f711a48924df9a394d37edd67")
(setf (get linear_mpc::SetPose :datatype-) "linear_mpc/SetPose")
(setf (get linear_mpc::SetPose :request) linear_mpc::SetPoseRequest)
(setf (get linear_mpc::SetPose :response) linear_mpc::SetPoseResponse)

(defmethod linear_mpc::SetPoseRequest
  (:response () (instance linear_mpc::SetPoseResponse :init)))

(setf (get linear_mpc::SetPoseRequest :md5sum-) "f192399f711a48924df9a394d37edd67")
(setf (get linear_mpc::SetPoseRequest :datatype-) "linear_mpc/SetPoseRequest")
(setf (get linear_mpc::SetPoseRequest :definition-)
      "geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
")

(setf (get linear_mpc::SetPoseResponse :md5sum-) "f192399f711a48924df9a394d37edd67")
(setf (get linear_mpc::SetPoseResponse :datatype-) "linear_mpc/SetPoseResponse")
(setf (get linear_mpc::SetPoseResponse :definition-)
      "geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
")



(provide :linear_mpc/SetPose "f192399f711a48924df9a394d37edd67")


