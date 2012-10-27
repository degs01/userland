# Install script for directory: /home/viktor/userland/interface/vcos

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/vendor/brcm/islands")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/interface/vcos" TYPE FILE FILES
    "/home/viktor/userland/interface/vcos/vcos_assert.h"
    "/home/viktor/userland/interface/vcos/vcos_atomic_flags.h"
    "/home/viktor/userland/interface/vcos/vcos_blockpool.h"
    "/home/viktor/userland/interface/vcos/vcos_cmd.h"
    "/home/viktor/userland/interface/vcos/vcos_dlfcn.h"
    "/home/viktor/userland/interface/vcos/vcos_event_flags.h"
    "/home/viktor/userland/interface/vcos/vcos_event.h"
    "/home/viktor/userland/interface/vcos/vcos.h"
    "/home/viktor/userland/interface/vcos/vcos_init.h"
    "/home/viktor/userland/interface/vcos/vcos_inttypes.h"
    "/home/viktor/userland/interface/vcos/vcos_isr.h"
    "/home/viktor/userland/interface/vcos/vcos_legacy_isr.h"
    "/home/viktor/userland/interface/vcos/vcos_logging.h"
    "/home/viktor/userland/interface/vcos/vcos_logging_control.h"
    "/home/viktor/userland/interface/vcos/vcos_lowlevel_thread.h"
    "/home/viktor/userland/interface/vcos/vcos_mem.h"
    "/home/viktor/userland/interface/vcos/vcos_mempool.h"
    "/home/viktor/userland/interface/vcos/vcos_msgqueue.h"
    "/home/viktor/userland/interface/vcos/vcos_mutex.h"
    "/home/viktor/userland/interface/vcos/vcos_named_semaphore.h"
    "/home/viktor/userland/interface/vcos/vcos_once.h"
    "/home/viktor/userland/interface/vcos/vcos_queue.h"
    "/home/viktor/userland/interface/vcos/vcos_quickslow_mutex.h"
    "/home/viktor/userland/interface/vcos/vcos_reentrant_mutex.h"
    "/home/viktor/userland/interface/vcos/vcos_semaphore.h"
    "/home/viktor/userland/interface/vcos/vcos_stdint.h"
    "/home/viktor/userland/interface/vcos/vcos_string.h"
    "/home/viktor/userland/interface/vcos/vcos_thread_attr.h"
    "/home/viktor/userland/interface/vcos/vcos_thread.h"
    "/home/viktor/userland/interface/vcos/vcos_timer.h"
    "/home/viktor/userland/interface/vcos/vcos_tls.h"
    "/home/viktor/userland/interface/vcos/vcos_types.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/viktor/userland/build/arm-android/release/interface/vcos/pthreads/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

