# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yangrui/junhan_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yangrui/junhan_ws/build

# Include any dependencies generated for this target.
include crazyflie_driver/CMakeFiles/crazyflie_server.dir/depend.make

# Include the progress variables for this target.
include crazyflie_driver/CMakeFiles/crazyflie_server.dir/progress.make

# Include the compile flags for this target's objects.
include crazyflie_driver/CMakeFiles/crazyflie_server.dir/flags.make

crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o: crazyflie_driver/CMakeFiles/crazyflie_server.dir/flags.make
crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o: /home/yangrui/junhan_ws/src/crazyflie_driver/src/crazyflie_server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yangrui/junhan_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o"
	cd /home/yangrui/junhan_ws/build/crazyflie_driver && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o -c /home/yangrui/junhan_ws/src/crazyflie_driver/src/crazyflie_server.cpp

crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.i"
	cd /home/yangrui/junhan_ws/build/crazyflie_driver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yangrui/junhan_ws/src/crazyflie_driver/src/crazyflie_server.cpp > CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.i

crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.s"
	cd /home/yangrui/junhan_ws/build/crazyflie_driver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yangrui/junhan_ws/src/crazyflie_driver/src/crazyflie_server.cpp -o CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.s

crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o.requires:

.PHONY : crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o.requires

crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o.provides: crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o.requires
	$(MAKE) -f crazyflie_driver/CMakeFiles/crazyflie_server.dir/build.make crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o.provides.build
.PHONY : crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o.provides

crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o.provides.build: crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o


# Object files for target crazyflie_server
crazyflie_server_OBJECTS = \
"CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o"

# External object files for target crazyflie_server
crazyflie_server_EXTERNAL_OBJECTS =

/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: crazyflie_driver/CMakeFiles/crazyflie_server.dir/build.make
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /home/yangrui/yr_ws/devel/.private/tf/lib/libtf.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/libtf2_ros.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/libactionlib.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/libmessage_filters.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/libroscpp.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/libtf2.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/librosconsole.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/librostime.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /opt/ros/kinetic/lib/libcpp_common.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /home/yangrui/junhan_ws/devel/lib/libcrazyflie_cpp.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: /usr/lib/x86_64-linux-gnu/libusb-1.0.so
/home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server: crazyflie_driver/CMakeFiles/crazyflie_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yangrui/junhan_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server"
	cd /home/yangrui/junhan_ws/build/crazyflie_driver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/crazyflie_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
crazyflie_driver/CMakeFiles/crazyflie_server.dir/build: /home/yangrui/junhan_ws/devel/lib/crazyflie_driver/crazyflie_server

.PHONY : crazyflie_driver/CMakeFiles/crazyflie_server.dir/build

crazyflie_driver/CMakeFiles/crazyflie_server.dir/requires: crazyflie_driver/CMakeFiles/crazyflie_server.dir/src/crazyflie_server.cpp.o.requires

.PHONY : crazyflie_driver/CMakeFiles/crazyflie_server.dir/requires

crazyflie_driver/CMakeFiles/crazyflie_server.dir/clean:
	cd /home/yangrui/junhan_ws/build/crazyflie_driver && $(CMAKE_COMMAND) -P CMakeFiles/crazyflie_server.dir/cmake_clean.cmake
.PHONY : crazyflie_driver/CMakeFiles/crazyflie_server.dir/clean

crazyflie_driver/CMakeFiles/crazyflie_server.dir/depend:
	cd /home/yangrui/junhan_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yangrui/junhan_ws/src /home/yangrui/junhan_ws/src/crazyflie_driver /home/yangrui/junhan_ws/build /home/yangrui/junhan_ws/build/crazyflie_driver /home/yangrui/junhan_ws/build/crazyflie_driver/CMakeFiles/crazyflie_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : crazyflie_driver/CMakeFiles/crazyflie_server.dir/depend

