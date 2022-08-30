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
include src/CMakeFiles/poser_barycentric_svd.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/poser_barycentric_svd.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/poser_barycentric_svd.dir/flags.make

src/CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.o: src/CMakeFiles/poser_barycentric_svd.dir/flags.make
src/CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.o: ../src/poser_barycentric_svd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/libsurv_udp/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.o"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.o -c /home/pi/libsurv_udp/src/poser_barycentric_svd.c

src/CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.i"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/libsurv_udp/src/poser_barycentric_svd.c > CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.i

src/CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.s"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/libsurv_udp/src/poser_barycentric_svd.c -o CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.s

src/CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.o: src/CMakeFiles/poser_barycentric_svd.dir/flags.make
src/CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.o: ../src/barycentric_svd/barycentric_svd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/libsurv_udp/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.o"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.o -c /home/pi/libsurv_udp/src/barycentric_svd/barycentric_svd.c

src/CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.i"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/libsurv_udp/src/barycentric_svd/barycentric_svd.c > CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.i

src/CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.s"
	cd /home/pi/libsurv_udp/bin/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/libsurv_udp/src/barycentric_svd/barycentric_svd.c -o CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.s

# Object files for target poser_barycentric_svd
poser_barycentric_svd_OBJECTS = \
"CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.o" \
"CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.o"

# External object files for target poser_barycentric_svd
poser_barycentric_svd_EXTERNAL_OBJECTS =

plugins/poser_barycentric_svd.so: src/CMakeFiles/poser_barycentric_svd.dir/poser_barycentric_svd.c.o
plugins/poser_barycentric_svd.so: src/CMakeFiles/poser_barycentric_svd.dir/barycentric_svd/barycentric_svd.c.o
plugins/poser_barycentric_svd.so: src/CMakeFiles/poser_barycentric_svd.dir/build.make
plugins/poser_barycentric_svd.so: libsurvive.so.0.3
plugins/poser_barycentric_svd.so: redist/libmpfit.a
plugins/poser_barycentric_svd.so: libs/cnkalman/src/libcnkalman.a
plugins/poser_barycentric_svd.so: libs/cnkalman/libs/cnmatrix/src/libcnmatrix.a
plugins/poser_barycentric_svd.so: src/CMakeFiles/poser_barycentric_svd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/libsurv_udp/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library ../plugins/poser_barycentric_svd.so"
	cd /home/pi/libsurv_udp/bin/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/poser_barycentric_svd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/poser_barycentric_svd.dir/build: plugins/poser_barycentric_svd.so

.PHONY : src/CMakeFiles/poser_barycentric_svd.dir/build

src/CMakeFiles/poser_barycentric_svd.dir/clean:
	cd /home/pi/libsurv_udp/bin/src && $(CMAKE_COMMAND) -P CMakeFiles/poser_barycentric_svd.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/poser_barycentric_svd.dir/clean

src/CMakeFiles/poser_barycentric_svd.dir/depend:
	cd /home/pi/libsurv_udp/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/libsurv_udp /home/pi/libsurv_udp/src /home/pi/libsurv_udp/bin /home/pi/libsurv_udp/bin/src /home/pi/libsurv_udp/bin/src/CMakeFiles/poser_barycentric_svd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/poser_barycentric_svd.dir/depend

