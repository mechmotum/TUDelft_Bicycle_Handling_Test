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
CMAKE_BINARY_DIR = /home/pi/libsurv_udp/bin

# Include any dependencies generated for this target.
include src/CMakeFiles/disambiguator_statebased.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/disambiguator_statebased.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/disambiguator_statebased.dir/flags.make

src/CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.o: src/CMakeFiles/disambiguator_statebased.dir/flags.make
src/CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.o: ../src/disambiguator_statebased.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/libsurv_udp/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.o"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.o -c /home/pi/libsurv_udp/src/disambiguator_statebased.c

src/CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.i"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/libsurv_udp/src/disambiguator_statebased.c > CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.i

src/CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.s"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/libsurv_udp/src/disambiguator_statebased.c -o CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.s

# Object files for target disambiguator_statebased
disambiguator_statebased_OBJECTS = \
"CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.o"

# External object files for target disambiguator_statebased
disambiguator_statebased_EXTERNAL_OBJECTS =

plugins/disambiguator_statebased.so: src/CMakeFiles/disambiguator_statebased.dir/disambiguator_statebased.c.o
plugins/disambiguator_statebased.so: src/CMakeFiles/disambiguator_statebased.dir/build.make
plugins/disambiguator_statebased.so: libsurvive.so.0.3
plugins/disambiguator_statebased.so: redist/libmpfit.a
plugins/disambiguator_statebased.so: libs/cnkalman/src/libcnkalman.a
plugins/disambiguator_statebased.so: libs/cnkalman/libs/cnmatrix/src/libcnmatrix.a
plugins/disambiguator_statebased.so: src/CMakeFiles/disambiguator_statebased.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/libsurv_udp/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../plugins/disambiguator_statebased.so"
	cd /home/pi/libsurv_udp/bin/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/disambiguator_statebased.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/disambiguator_statebased.dir/build: plugins/disambiguator_statebased.so

.PHONY : src/CMakeFiles/disambiguator_statebased.dir/build

src/CMakeFiles/disambiguator_statebased.dir/clean:
	cd /home/pi/libsurv_udp/bin/src && $(CMAKE_COMMAND) -P CMakeFiles/disambiguator_statebased.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/disambiguator_statebased.dir/clean

src/CMakeFiles/disambiguator_statebased.dir/depend:
	cd /home/pi/libsurv_udp/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/libsurv_udp /home/pi/libsurv_udp/src /home/pi/libsurv_udp/bin /home/pi/libsurv_udp/bin/src /home/pi/libsurv_udp/bin/src/CMakeFiles/disambiguator_statebased.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/disambiguator_statebased.dir/depend
