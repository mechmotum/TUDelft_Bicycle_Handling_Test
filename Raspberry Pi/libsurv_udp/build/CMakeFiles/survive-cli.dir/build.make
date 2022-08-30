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
include CMakeFiles/survive-cli.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/survive-cli.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/survive-cli.dir/flags.make

CMakeFiles/survive-cli.dir/survive-cli.c.o: CMakeFiles/survive-cli.dir/flags.make
CMakeFiles/survive-cli.dir/survive-cli.c.o: ../survive-cli.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/libsurv_udp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/survive-cli.dir/survive-cli.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/survive-cli.dir/survive-cli.c.o -c /home/pi/libsurv_udp/survive-cli.c

CMakeFiles/survive-cli.dir/survive-cli.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/survive-cli.dir/survive-cli.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/libsurv_udp/survive-cli.c > CMakeFiles/survive-cli.dir/survive-cli.c.i

CMakeFiles/survive-cli.dir/survive-cli.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/survive-cli.dir/survive-cli.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/libsurv_udp/survive-cli.c -o CMakeFiles/survive-cli.dir/survive-cli.c.s

# Object files for target survive-cli
survive__cli_OBJECTS = \
"CMakeFiles/survive-cli.dir/survive-cli.c.o"

# External object files for target survive-cli
survive__cli_EXTERNAL_OBJECTS =

survive-cli: CMakeFiles/survive-cli.dir/survive-cli.c.o
survive-cli: CMakeFiles/survive-cli.dir/build.make
survive-cli: libsurvive.so.0.3
survive-cli: redist/libmpfit.a
survive-cli: libs/cnkalman/src/libcnkalman.a
survive-cli: libs/cnkalman/libs/cnmatrix/src/libcnmatrix.a
survive-cli: CMakeFiles/survive-cli.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/libsurv_udp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable survive-cli"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/survive-cli.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -E copy /home/pi/libsurv_udp/useful_files/survive-websocketd /home/pi/libsurv_udp/build

# Rule to build all files generated by this target.
CMakeFiles/survive-cli.dir/build: survive-cli

.PHONY : CMakeFiles/survive-cli.dir/build

CMakeFiles/survive-cli.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/survive-cli.dir/cmake_clean.cmake
.PHONY : CMakeFiles/survive-cli.dir/clean

CMakeFiles/survive-cli.dir/depend:
	cd /home/pi/libsurv_udp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/libsurv_udp /home/pi/libsurv_udp /home/pi/libsurv_udp/build /home/pi/libsurv_udp/build /home/pi/libsurv_udp/build/CMakeFiles/survive-cli.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/survive-cli.dir/depend
