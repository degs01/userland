#
# CMake defines to cross-compile to ARM/Linux on BCM2708 using glibc.
#


# Note that the compilers should be in $ANDROID_TOOLCHAIN
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_C_COMPILER arm-linux-gnueabi-gcc-4.6)
SET(CMAKE_CXX_COMPILER arm-linux-gnueabi-g++-4.6)
SET(CMAKE_ASM_COMPILER arm-linux-gnueabi-as)
SET(CMAKE_SYSTEM_PROCESSOR arm)
SET(ANDROID_ROOT lib)
SET(ANDROID TRUE)
SET(DRONE TRUE)

#ADD_DEFINITIONS("-march=armv6")
add_definitions("-mcpu=arm1176jzf-s")

# rdynamic means the backtrace should work
IF (CMAKE_BUILD_TYPE MATCHES "Debug")
   add_definitions(-rdynamic)
ENDIF()

# avoids annoying and pointless warnings from gcc
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -U_FORTIFY_SOURCE")

