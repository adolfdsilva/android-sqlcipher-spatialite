LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ANDROID_SQLITE_PATH = android-sqlite/android

# these are all files from various external git repos
libsqlite3_android_local_src_files := \
	PhoneNumberUtils.cpp \
	OldPhoneNumberUtils.cpp \
	sqlite3_android.cpp

libsqlite3_android_c_includes := \
	$(LOCAL_PATH)/android-sqlite/android \
	$(LOCAL_PATH)/../sqlcipher/sqlcipher

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(addprefix $(ANDROID_SQLITE_PATH)/, $(libsqlite3_android_local_src_files))
LOCAL_C_INCLUDES := $(libsqlite3_android_c_includes)
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/android-sqlite/android
LOCAL_CFLAGS += -fvisibility=hidden
LOCAL_MODULE:= libsqlite3_android
LOCAL_STATIC_LIBRARIES := liblog_static libicuuc_static libicui18n_static
include $(BUILD_STATIC_LIBRARY)
