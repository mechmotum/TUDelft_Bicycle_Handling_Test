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
include redist/CMakeFiles/mpfit.dir/depend.make

# Include the progress variables for this target.
include redist/CMakeFiles/mpfit.dir/progress.make

# Include the compile flags for this target's objects.
include redist/CMakeFiles/mpfit.dir/flags.make

redist/CMakeFiles/mpfit.dir/mpfit/mpfit.c.o: redist/CMakeFiles/mpfit.dir/flags.make
redist/CMakeFiles/mpfit.dir/mpfit/mpfit.c.o: ../redist/mpfit/mpfit.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/libsurv_udp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object redist/CMakeFiles/mpfit.dir/mpfit/mpfit.c.o"
	cd /home/pi/libsurv_udp/build/redist && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mpfit.dir/mpfit/mpfit.c.o -c /home/pi/libsurv_udp/redist/mpfit/mpfit.c

redist/CMakeFiles/mpfit.dir/mpfit/mpfit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mpfit.dir/mpfit/mpfit.c.i"
	cd /home/pi/libsurv_udp/build/redist && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/libsurv_udp/redist/mpfit/mpfit.c > CMakeFiles/mpfit.dir/mpfit/mpfit.c.i

redist/CMakeFiles/mpfit.dir/mpfit/mpfit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mpfit.dir/mpfit/mpfit.c.s"
	cd /home/pi/libsurv_udp/build/redist && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/libsurv_udp/redist/mpfit/mpfit.c -o CMakeFiles/mpfit.dir/mpfit/mpfit.c.s

# Object files for target mpfit
mpfit_OBJECTS = \
"CMakeFiles/mpfit.dir/mpfit/mpfit.c.o"

# External object files for target mpfit
mpfit_EXTERNAL_OBJECTS =

redist/libmpfit.a: redist/CMakeFiles/mpfit.dir/mpfit/mpfit.c.o
redist/libmpfit.a: redist/CMakeFiles/mpfit.dir/build.make
redist/libmpfit.a: redist/CMakeFiles/mpfit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/libsurv_udp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libmpfit.a"
	cd /home/pi/libsurv_udp/build/redist && $(CMAKE_COMMAND) -P CMakeFiles/mpfit.dir/cmake_clean_target.cmake
	cd /home/pi/libsurv_udp/build/redist && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mpfit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
redist/CMakeFiles/mpfit.dir/build: redist/libmpfit.a

.PHONY : redist/CMakeFiles/mpfit.dir/build

redist/CMakeFiles/mpfit.dir/clean:
	cd /home/pi/libsurv_udp/build/redist && $(CMAKE_COMMAND) -P CMakeFiles/mpfit.dir/cmake_clean.cmake
.PHONY : redist/CMakeFiles/mpfit.dir/clean

redist/CMakeFiles/mpfit.dir/depend:
	cd /home/pi/libsurv_udp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/libsurv_udp /home/pi/libsurv_udp/redist /home/pi/libsurv_udp/build /home/pi/libsurv_udp/build/redist /home/pi/libsurv_udp/build/redist/CMakeFiles/mpfit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : redist/CMakeFiles/mpfit.dir/depend

