LOCAL_PATH := $(call my-dir)/openssl
include $(CLEAR_VARS)

include $(LOCAL_PATH)/../build-config-local.mk
include $(LOCAL_PATH)/../Crypto-config-local.mk

local_additional_dependencies := $(LOCAL_PATH)/android-config.mk $(LOCAL_PATH)/Crypto.mk
local_export_c_includes := $(LOCAL_PATH) $(LOCAL_PATH)/include

#######################################
# target static library
include $(CLEAR_VARS)
include $(LOCAL_PATH)/android-config.mk

LOCAL_SHARED_LIBRARIES := $(log_shared_libraries)

#LOCAL_SDK_VERSION := 9

LOCAL_SRC_FILES += $(target_src_files)
LOCAL_CFLAGS += $(target_c_flags) -fvisibility=hidden
LOCAL_C_INCLUDES += $(target_c_includes) $(addprefix $(LOCAL_PATH)/,$(common_c_includes))
LOCAL_EXPORT_C_INCLUDES := $(local_export_c_includes)
LOCAL_MODULE:= libcrypto_static
LOCAL_ADDITIONAL_DEPENDENCIES := $(local_additional_dependencies)
include $(BUILD_STATIC_LIBRARY)
