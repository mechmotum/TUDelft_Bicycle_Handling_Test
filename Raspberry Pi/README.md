# Libsurvive setup

0. Download source code from https://github.com/cntools/libsurvive
0. Put the `survive-udp.c` to the root folder of the source code
0. Check if the IP address in `survive-udp.c` matches the IP address of the receiving PC
0. Modify `CMakeLists.txt` to include `survive-udp.c` in $SURVIVE_EXECUTABLES or use the `CMakeLists.txt` supplied here
0. Do `make` to compile
0. Run `./bin/survive-udp --force-calibrate` to start the tool
