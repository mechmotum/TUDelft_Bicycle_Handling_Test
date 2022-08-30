# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/libsurv_udp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/libsurv_udp/build

# Include any dependencies generated for this target.
include src/CMakeFiles/driver_dummy.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/driver_dummy.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/driver_dummy.dir/flags.make

src/CMakeFiles/driver_dummy.dir/driver_dummy.c.o: src/CMakeFiles/driver_dummy.dir/flags.make
src/CMakeFiles/driver_dummy.dir/driver_dummy.c.o: ../src/driver_dummy.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/libsurv_udp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/driver_dummy.dir/driver_dummy.c.o"
	cd /home/pi/libsurv_udp/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/driver_dummy.dir/driver_dummy.c.o -c /home/pi/libsurv_udp/src/driver_dummy.c

src/CMakeFiles/driver_dummy.dir/driver_dummy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/driver_dummy.dir/driver_dummy.c.i"
	cd /home/pi/libsurv_udp/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/libsurv_udp/src/driver_dummy.c > CMakeFiles/driver_dummy.dir/driver_dummy.c.i

src/CMakeFiles/driver_dummy.dir/driver_dummy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/driver_dummy.dir/driver_dummy.c.s"
	cd /home/pi/libsurv_udp/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/libsurv_udp/src/driver_dummy.c -o CMakeFiles/driver_dummy.dir/driver_dummy.c.s

# Object files for target driver_dummy
driver_dummy_OBJECTS = \
"CMakeFiles/driver_dummy.dir/driver_dummy.c.o"

# External object files for target driver_dummy
driver_dummy_EXTERNAL_OBJECTS =

plugins/driver_dummy.so: src/CMakeFiles/driver_dummy.dir/driver_dummy.c.o
plugins/driver_dummy.so: src/CMakeFiles/driver_dummy.dir/build.make
plugins/driver_dummy.so: libsurvive.so.0.3
plugins/driver_dummy.so: redist/libmpfit.a
plugins/driver_dummy.so: libs/cnkalman/src/libcnkalman.a
plugins/driver_dummy.so: libs/cnkalman/libs/cnmatrix/src/libcnmatrix.a
plugins/driver_dummy.so: src/CMakeFiles/driver_dummy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/libsurv_udp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../plugins/driver_dummy.so"
	cd /home/pi/libsurv_udp/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/driver_dummy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/driver_dummy.dir/build: plugins/driver_dummy.so

.PHONY : src/CMakeFiles/driver_dummy.dir/build

src/CMakeFiles/driver_dummy.dir/clean:
	cd /home/pi/libsurv_udp/build/src && $(CMAKE_COMMAND) -P CMakeFiles/driver_dummy.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/driver_dummy.dir/clean

src/CMakeFiles/driver_dummy.dir/depend:
	cd /home/pi/libsurv_udp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/libsurv_udp /home/pi/libsurv_udp/src /home/pi/libsurv_udp/build /home/pi/libsurv_udp/build/src /home/pi/libsurv_udp/build/src/CMakeFiles/driver_dummy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/driver_dummy.dir/depend

