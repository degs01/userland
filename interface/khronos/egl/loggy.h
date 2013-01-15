#ifndef __LOGGY__
#define NO_OPENVG 1
#include "include/android/log.h"
#define LOG_TAG "LOGGY_WARG"

# define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
# define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

#define __LOGGY__ 1
#endif
