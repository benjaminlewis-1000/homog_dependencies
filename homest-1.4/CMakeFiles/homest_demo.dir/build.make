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
CMAKE_SOURCE_DIR = /home/benjamin/Research/Code/homest-1.4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/benjamin/Research/Code/homest-1.4

# Include any dependencies generated for this target.
include CMakeFiles/homest_demo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/homest_demo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/homest_demo.dir/flags.make

CMakeFiles/homest_demo.dir/homest_demo.c.o: CMakeFiles/homest_demo.dir/flags.make
CMakeFiles/homest_demo.dir/homest_demo.c.o: homest_demo.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/benjamin/Research/Code/homest-1.4/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/homest_demo.dir/homest_demo.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/homest_demo.dir/homest_demo.c.o   -c /home/benjamin/Research/Code/homest-1.4/homest_demo.c

CMakeFiles/homest_demo.dir/homest_demo.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/homest_demo.dir/homest_demo.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/benjamin/Research/Code/homest-1.4/homest_demo.c > CMakeFiles/homest_demo.dir/homest_demo.c.i

CMakeFiles/homest_demo.dir/homest_demo.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/homest_demo.dir/homest_demo.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/benjamin/Research/Code/homest-1.4/homest_demo.c -o CMakeFiles/homest_demo.dir/homest_demo.c.s

CMakeFiles/homest_demo.dir/homest_demo.c.o.requires:
.PHONY : CMakeFiles/homest_demo.dir/homest_demo.c.o.requires

CMakeFiles/homest_demo.dir/homest_demo.c.o.provides: CMakeFiles/homest_demo.dir/homest_demo.c.o.requires
	$(MAKE) -f CMakeFiles/homest_demo.dir/build.make CMakeFiles/homest_demo.dir/homest_demo.c.o.provides.build
.PHONY : CMakeFiles/homest_demo.dir/homest_demo.c.o.provides

CMakeFiles/homest_demo.dir/homest_demo.c.o.provides.build: CMakeFiles/homest_demo.dir/homest_demo.c.o

# Object files for target homest_demo
homest_demo_OBJECTS = \
"CMakeFiles/homest_demo.dir/homest_demo.c.o"

# External object files for target homest_demo
homest_demo_EXTERNAL_OBJECTS =

homest_demo: CMakeFiles/homest_demo.dir/homest_demo.c.o
homest_demo: CMakeFiles/homest_demo.dir/build.make
homest_demo: libhomest.a
homest_demo: CMakeFiles/homest_demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable homest_demo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/homest_demo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/homest_demo.dir/build: homest_demo
.PHONY : CMakeFiles/homest_demo.dir/build

CMakeFiles/homest_demo.dir/requires: CMakeFiles/homest_demo.dir/homest_demo.c.o.requires
.PHONY : CMakeFiles/homest_demo.dir/requires

CMakeFiles/homest_demo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/homest_demo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/homest_demo.dir/clean

CMakeFiles/homest_demo.dir/depend:
	cd /home/benjamin/Research/Code/homest-1.4 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/benjamin/Research/Code/homest-1.4 /home/benjamin/Research/Code/homest-1.4 /home/benjamin/Research/Code/homest-1.4 /home/benjamin/Research/Code/homest-1.4 /home/benjamin/Research/Code/homest-1.4/CMakeFiles/homest_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/homest_demo.dir/depend

