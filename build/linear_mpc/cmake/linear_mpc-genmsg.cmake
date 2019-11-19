# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "linear_mpc: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(linear_mpc_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv" NAME_WE)
add_custom_target(_linear_mpc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "linear_mpc" "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv" "geometry_msgs/Point:geometry_msgs/Pose:geometry_msgs/Quaternion"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(linear_mpc
  "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/linear_mpc
)

### Generating Module File
_generate_module_cpp(linear_mpc
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/linear_mpc
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(linear_mpc_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(linear_mpc_generate_messages linear_mpc_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv" NAME_WE)
add_dependencies(linear_mpc_generate_messages_cpp _linear_mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linear_mpc_gencpp)
add_dependencies(linear_mpc_gencpp linear_mpc_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linear_mpc_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(linear_mpc
  "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/linear_mpc
)

### Generating Module File
_generate_module_eus(linear_mpc
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/linear_mpc
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(linear_mpc_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(linear_mpc_generate_messages linear_mpc_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv" NAME_WE)
add_dependencies(linear_mpc_generate_messages_eus _linear_mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linear_mpc_geneus)
add_dependencies(linear_mpc_geneus linear_mpc_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linear_mpc_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(linear_mpc
  "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/linear_mpc
)

### Generating Module File
_generate_module_lisp(linear_mpc
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/linear_mpc
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(linear_mpc_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(linear_mpc_generate_messages linear_mpc_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv" NAME_WE)
add_dependencies(linear_mpc_generate_messages_lisp _linear_mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linear_mpc_genlisp)
add_dependencies(linear_mpc_genlisp linear_mpc_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linear_mpc_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(linear_mpc
  "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/linear_mpc
)

### Generating Module File
_generate_module_nodejs(linear_mpc
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/linear_mpc
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(linear_mpc_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(linear_mpc_generate_messages linear_mpc_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv" NAME_WE)
add_dependencies(linear_mpc_generate_messages_nodejs _linear_mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linear_mpc_gennodejs)
add_dependencies(linear_mpc_gennodejs linear_mpc_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linear_mpc_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(linear_mpc
  "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linear_mpc
)

### Generating Module File
_generate_module_py(linear_mpc
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linear_mpc
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(linear_mpc_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(linear_mpc_generate_messages linear_mpc_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangrui/junhan_ws/src/linear_mpc/srv/SetPose.srv" NAME_WE)
add_dependencies(linear_mpc_generate_messages_py _linear_mpc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linear_mpc_genpy)
add_dependencies(linear_mpc_genpy linear_mpc_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linear_mpc_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/linear_mpc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/linear_mpc
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(linear_mpc_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/linear_mpc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/linear_mpc
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(linear_mpc_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/linear_mpc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/linear_mpc
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(linear_mpc_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/linear_mpc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/linear_mpc
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(linear_mpc_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linear_mpc)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linear_mpc\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linear_mpc
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(linear_mpc_generate_messages_py geometry_msgs_generate_messages_py)
endif()
