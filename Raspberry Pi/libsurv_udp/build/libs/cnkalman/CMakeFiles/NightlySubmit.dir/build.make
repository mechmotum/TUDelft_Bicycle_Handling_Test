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

# Utility rule file for NightlySubmit.

# Include the progress variables for this target.
include libs/cnkalman/CMakeFiles/NightlySubmit.dir/progress.make

libs/cnkalman/CMakeFiles/NightlySubmit:
	cd /home/pi/libsurv_udp/build/libs/cnkalman && /usr/bin/ctest -D NightlySubmit

NightlySubmit: libs/cnkalman/CMakeFiles/NightlySubmit
NightlySubmit: libs/cnkalman/CMakeFiles/NightlySubmit.dir/build.make

.PHONY : NightlySubmit

# Rule to build all files generated by this target.
libs/cnkalman/CMakeFiles/NightlySubmit.dir/build: NightlySubmit

.PHONY : libs/cnkalman/CMakeFiles/NightlySubmit.dir/build

libs/cnkalman/CMakeFiles/NightlySubmit.dir/clean:
	cd /home/pi/libsurv_udp/build/libs/cnkalman && $(CMAKE_COMMAND) -P CMakeFiles/NightlySubmit.dir/cmake_clean.cmake
.PHONY : libs/cnkalman/CMakeFiles/NightlySubmit.dir/clean

libs/cnkalman/CMakeFiles/NightlySubmit.dir/depend:
	cd /home/pi/libsurv_udp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/libsurv_udp /home/pi/libsurv_udp/libs/cnkalman /home/pi/libsurv_udp/build /home/pi/libsurv_udp/build/libs/cnkalman /home/pi/libsurv_udp/build/libs/cnkalman/CMakeFiles/NightlySubmit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/cnkalman/CMakeFiles/NightlySubmit.dir/depend
