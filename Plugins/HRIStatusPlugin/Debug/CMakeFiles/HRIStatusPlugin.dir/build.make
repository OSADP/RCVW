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
CMAKE_SOURCE_DIR = /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/Debug

# Include any dependencies generated for this target.
include CMakeFiles/HRIStatusPlugin.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/HRIStatusPlugin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/HRIStatusPlugin.dir/flags.make

CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o: CMakeFiles/HRIStatusPlugin.dir/flags.make
CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o: ../src/HRIStatusPlugin.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/Debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o -c /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/src/HRIStatusPlugin.cpp

CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/src/HRIStatusPlugin.cpp > CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.i

CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/src/HRIStatusPlugin.cpp -o CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.s

CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o.requires:
.PHONY : CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o.requires

CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o.provides: CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o.requires
	$(MAKE) -f CMakeFiles/HRIStatusPlugin.dir/build.make CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o.provides.build
.PHONY : CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o.provides

CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o.provides.build: CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o

# Object files for target HRIStatusPlugin
HRIStatusPlugin_OBJECTS = \
"CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o"

# External object files for target HRIStatusPlugin
HRIStatusPlugin_EXTERNAL_OBJECTS =

HRIStatusPlugin: CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o
HRIStatusPlugin: CMakeFiles/HRIStatusPlugin.dir/build.make
HRIStatusPlugin: /usr/local/lib/libtmxutils.a
HRIStatusPlugin: /usr/local/lib/libtmxapi.so
HRIStatusPlugin: /usr/local/lib/libasn_j2735_r41.so
HRIStatusPlugin: /usr/local/lib/libaiousb.so
HRIStatusPlugin: /lib/x86_64-linux-gnu/libusb-1.0.so.0
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_system.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_thread.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_regex.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_log.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_log_setup.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libpthread.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libmysqlclient.so
HRIStatusPlugin: /usr/local/lib/libmysqlcppconn.so
HRIStatusPlugin: /usr/local/lib/libaiousb.so
HRIStatusPlugin: /lib/x86_64-linux-gnu/libusb-1.0.so.0
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_system.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_thread.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_regex.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_log.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_log_setup.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libpthread.so
HRIStatusPlugin: /usr/lib/x86_64-linux-gnu/libmysqlclient.so
HRIStatusPlugin: /usr/local/lib/libmysqlcppconn.so
HRIStatusPlugin: CMakeFiles/HRIStatusPlugin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable HRIStatusPlugin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HRIStatusPlugin.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/make bundle_HRIStatusPlugin_cleanup

# Rule to build all files generated by this target.
CMakeFiles/HRIStatusPlugin.dir/build: HRIStatusPlugin
.PHONY : CMakeFiles/HRIStatusPlugin.dir/build

CMakeFiles/HRIStatusPlugin.dir/requires: CMakeFiles/HRIStatusPlugin.dir/src/HRIStatusPlugin.cpp.o.requires
.PHONY : CMakeFiles/HRIStatusPlugin.dir/requires

CMakeFiles/HRIStatusPlugin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/HRIStatusPlugin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/HRIStatusPlugin.dir/clean

CMakeFiles/HRIStatusPlugin.dir/depend:
	cd /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/Debug /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/Debug /media/sf_Shared/RCVW/Plugins/HRIStatusPlugin/Debug/CMakeFiles/HRIStatusPlugin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/HRIStatusPlugin.dir/depend

