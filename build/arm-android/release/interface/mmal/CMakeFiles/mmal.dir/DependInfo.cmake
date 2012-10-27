# The set of languages for which implicit dependencies are needed:
SET(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
SET(CMAKE_DEPENDS_CHECK_C
  "/home/viktor/userland/interface/mmal/util/mmal_util.c" "/home/viktor/userland/build/arm-android/release/interface/mmal/CMakeFiles/mmal.dir/util/mmal_util.c.o"
  )
SET(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
SET(CMAKE_TARGET_DEFINITIONS
  "_HAVE_SBRK"
  "_LARGEFILE64_SOURCE"
  "HAVE_CMAKE_CONFIG"
  "HAVE_VMCS_CONFIG"
  "_REENTRANT"
  "USE_VCHIQ_ARM"
  "VCHI_BULK_ALIGN=1"
  "VCHI_BULK_GRANULARITY=1"
  "OMX_SKIP64BIT"
  "EGL_SERVER_DISPMANX"
  "_LARGEFILE_SOURCE"
  "_LARGEFILE64_SOURCE"
  "__VIDEOCORE4__"
  )

# Targets to which this target links.
SET(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/viktor/userland/build/arm-android/release/interface/mmal/core/CMakeFiles/mmal_core.dir/DependInfo.cmake"
  "/home/viktor/userland/build/arm-android/release/interface/mmal/util/CMakeFiles/mmal_util.dir/DependInfo.cmake"
  "/home/viktor/userland/build/arm-android/release/interface/mmal/vc/CMakeFiles/mmal_vc_client.dir/DependInfo.cmake"
  "/home/viktor/userland/build/arm-android/release/interface/vcos/pthreads/CMakeFiles/vcos.dir/DependInfo.cmake"
  "/home/viktor/userland/build/arm-android/release/interface/vchiq_arm/CMakeFiles/vchiq_arm.dir/DependInfo.cmake"
  )

# The include file search paths:
SET(CMAKE_C_TARGET_INCLUDE_PATH
  "../../inc"
  "/home/viktor/cm/prebuilt/ndk/android-ndk-r/platforms/android-/arch-arm/usr/include"
  "../../../BEFORE"
  "/home/viktor/cm/bionic/libc/include/arch-arm/include"
  "/home/viktor/cm/bionic/libc/include"
  "/home/viktor/cm/bionic/libc/kernel/arch-arm"
  "/home/viktor/cm/bionic/libc/kernel/common"
  "/home/viktor/cm/bionic/libm/include"
  "/home/viktor/cm/bionic/libm/include/arch/arm"
  "/home/viktor/cm/bionic/libstdc++/include"
  "../../../host_applications/framework"
  "../../.."
  "../../../interface/vcos/pthreads"
  "../../../interface/vmcs_host/linux"
  "../../../interface/vmcs_host"
  "../../../interface/vmcs_host/khronos"
  "../../../interface/khronos/include"
  "."
  "../../../interface/vchiq_arm"
  "../../../host_support/include"
  "../../../interface/mmal"
  )
SET(CMAKE_CXX_TARGET_INCLUDE_PATH ${CMAKE_C_TARGET_INCLUDE_PATH})
SET(CMAKE_Fortran_TARGET_INCLUDE_PATH ${CMAKE_C_TARGET_INCLUDE_PATH})
SET(CMAKE_ASM_TARGET_INCLUDE_PATH ${CMAKE_C_TARGET_INCLUDE_PATH})