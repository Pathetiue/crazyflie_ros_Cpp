
(cl:in-package :asdf)

(defsystem "linear_mpc-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "SetPose" :depends-on ("_package_SetPose"))
    (:file "_package_SetPose" :depends-on ("_package"))
    (:file "SetTrajectory" :depends-on ("_package_SetTrajectory"))
    (:file "_package_SetTrajectory" :depends-on ("_package"))
  ))