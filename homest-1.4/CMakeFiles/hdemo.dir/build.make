# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/benjamin/catkin_ws/src/dependencies/homest-1.4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/benjamin/catkin_ws/src/dependencies/homest-1.4

# Include any dependencies generated for this target.
include CMakeFiles/hdemo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hdemo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hdemo.dir/flags.make

CMakeFiles/hdemo.dir/homest_demo2.cpp.o: CMakeFiles/hdemo.dir/flags.make
CMakeFiles/hdemo.dir/homest_demo2.cpp.o: homest_demo2.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/benjamin/catkin_ws/src/dependencies/homest-1.4/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/hdemo.dir/homest_demo2.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/hdemo.dir/homest_demo2.cpp.o -c /home/benjamin/catkin_ws/src/dependencies/homest-1.4/homest_demo2.cpp

CMakeFiles/hdemo.dir/homest_demo2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hdemo.dir/homest_demo2.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/benjamin/catkin_ws/src/dependencies/homest-1.4/homest_demo2.cpp > CMakeFiles/hdemo.dir/homest_demo2.cpp.i

CMakeFiles/hdemo.dir/homest_demo2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hdemo.dir/homest_demo2.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/benjamin/catkin_ws/src/dependencies/homest-1.4/homest_demo2.cpp -o CMakeFiles/hdemo.dir/homest_demo2.cpp.s

CMakeFiles/hdemo.dir/homest_demo2.cpp.o.requires:
.PHONY : CMakeFiles/hdemo.dir/homest_demo2.cpp.o.requires

CMakeFiles/hdemo.dir/homest_demo2.cpp.o.provides: CMakeFiles/hdemo.dir/homest_demo2.cpp.o.requires
	$(MAKE) -f CMakeFiles/hdemo.dir/build.make CMakeFiles/hdemo.dir/homest_demo2.cpp.o.provides.build
.PHONY : CMakeFiles/hdemo.dir/homest_demo2.cpp.o.provides

CMakeFiles/hdemo.dir/homest_demo2.cpp.o.provides.build: CMakeFiles/hdemo.dir/homest_demo2.cpp.o

# Object files for target hdemo
hdemo_OBJECTS = \
"CMakeFiles/hdemo.dir/homest_demo2.cpp.o"

# External object files for target hdemo
hdemo_EXTERNAL_OBJECTS =

hdemo: CMakeFiles/hdemo.dir/homest_demo2.cpp.o
hdemo: CMakeFiles/hdemo.dir/build.make
hdemo: libhomest.a
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_ts.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_nonfree.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_nonfree.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
hdemo: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
hdemo: CMakeFiles/hdemo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable hdemo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hdemo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hdemo.dir/build: hdemo
.PHONY : CMakeFiles/hdemo.dir/build

CMakeFiles/hdemo.dir/requires: CMakeFiles/hdemo.dir/homest_demo2.cpp.o.requires
.PHONY : CMakeFiles/hdemo.dir/requires

CMakeFiles/hdemo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hdemo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hdemo.dir/clean

CMakeFiles/hdemo.dir/depend:
	cd /home/benjamin/catkin_ws/src/dependencies/homest-1.4 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/benjamin/catkin_ws/src/dependencies/homest-1.4 /home/benjamin/catkin_ws/src/dependencies/homest-1.4 /home/benjamin/catkin_ws/src/dependencies/homest-1.4 /home/benjamin/catkin_ws/src/dependencies/homest-1.4 /home/benjamin/catkin_ws/src/dependencies/homest-1.4/CMakeFiles/hdemo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hdemo.dir/depend

