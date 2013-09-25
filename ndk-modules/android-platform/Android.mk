LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android_platform_utils
LOCAL_SRC_FILES := dummy.c
LOCAL_EXPORT_C_INCLUDES := \
	$(LOCAL_PATH)/platform_system_core/include \
	$(LOCAL_PATH)/platform_frameworks_base/include
LOCAL_EXPORT_LDLIBS := \
	-L$(LOCAL_PATH)/libs/$(TARGET_ARCH_ABI)

include $(BUILD_STATIC_LIBRARY)


android_utils_local_src_files := \
	SharedBuffer.cpp \
	String16.cpp \
	String8.cpp

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(android_utils_local_src_files)
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/platform_system_core/include \
	$(LOCAL_PATH)/platform_frameworks_base/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_MODULE:= android_platform_utils_static
LOCAL_CFLAGS += -DOS_PATH_SEPARATOR="'/'" -DHAVE_SYS_UIO_H -fvisibility=hidden 
include $(BUILD_STATIC_LIBRARY)
