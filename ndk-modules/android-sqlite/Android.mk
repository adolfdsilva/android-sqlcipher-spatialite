LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# these are all files from various external git repos
libsqlite3_android_local_src_files := \
        android-sqlite/android/sqlite3_android.cpp \
        android-sqlite/android/PhonebookIndex.cpp \
        android-sqlite/android/PhoneNumberUtils.cpp \
        android-sqlite/android/OldPhoneNumberUtils.cpp \
        android-sqlite/android/PhoneticStringUtils.cpp \
        String16.cpp \
        String8.cpp

LOCAL_STATIC_LIBRARIES := libsqlcipher android-platform-utils
LOCAL_STATIC_LIBRARIES += libicui18n libicuuc

LOCAL_CFLAGS += -fvisibility=hidden -DOS_PATH_SEPARATOR="'/'" -DHAVE_SYS_UIO_H

LOCAL_C_INCLUDES := \
        $(LOCAL_PATH)/include \
        $(LOCAL_PATH)/android-sqlite

LOCAL_MODULE := libsqlcipher_android
LOCAL_SRC_FILES := $(libsqlite3_android_local_src_files)

LOCAL_EXPORT_C_INCLUDES := \
    $(LOCAL_PATH)/android-sqlite/android

include $(BUILD_STATIC_LIBRARY)
