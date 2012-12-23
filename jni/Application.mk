APP_PROJECT_PATH := $(shell pwd)
APP_ABI := armeabi-v7a armeabi x86
APP_BUILD_SCRIPT := $(APP_PROJECT_PATH)/Android.mk
APP_STL := stlport_shared
APP_CPPFLAGS += -frtti -fexceptions
APP_PLATFORM := android-7

NDK_TOOLCHAIN_VERSION=4.7

