#
# Before building using this do:
#	ndk-build build-local-hack
#   ndk-build

LOCAL_PATH := $(call my-dir)

# NOTE the following flags,
#   SQLITE_TEMP_STORE=3 causes all TEMP files to go into RAM. and thats the behavior we want
#   SQLITE_ENABLE_FTS3   enables usage of FTS3 - NOT FTS1 or 2.
#   SQLITE_DEFAULT_AUTOVACUUM=1  causes the databases to be subject to auto-vacuum
ANDROID_SQLITE_CFLAGS :=  -DHAVE_USLEEP=1 \
	-DSQLITE_DEFAULT_JOURNAL_SIZE_LIMIT=1048576 -DSQLITE_THREADSAFE=1 \
	-DSQLITE_ENABLE_MEMORY_MANAGEMENT=1 -DSQLITE_TEMP_STORE=3 \
	-DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_BACKWARDS \
	-DSQLITE_ENABLE_LOAD_EXTENSION

SQLCIPHER_CFLAGS := -DSQLITE_HAS_CODEC -DHAVE_FDATASYNC=0
#SQLITE_VISIBILITY_CFLAGS :=  \
	-DSQLITE_API='__attribute__ ((visibility ("default")))'

# how on earth to you make this damn Android build system run cmd line progs?!?!
build-local-hack: sqlcipher/sqlite3.c

sqlcipher/sqlite3.c:
	cd $(CURDIR)/sqlcipher && ./configure CFLAGS="${ANDROID_SQLITE_CFLAGS} ${SQLCIPHER_CFLAGS}"
	make -C sqlcipher sqlite3.c

#------------------------------------------------------------------------------#
# libsqlite3

sqlcipher_files := \
	sqlcipher/sqlite3.c


include $(CLEAR_VARS)

LOCAL_CFLAGS += \
		$(ANDROID_SQLITE_CFLAGS) \
		$(SQLCIPHER_CFLAGS) \
		-Dfdatasync=fsync \
		-fvisibility=hidden \
		-DNDEBUG=1 \
		$(SQLITE_VISIBILITY_CFLAGS)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/sqlcipher
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sqlcipher
LOCAL_EXPORT_CFLAGS += \
		$(ANDROID_SQLITE_CFLAGS) \
		$(SQLCIPHER_CFLAGS) \
		$(SQLITE_VISIBILITY_CFLAGS)

LOCAL_MODULE    := libsqlcipher
LOCAL_SRC_FILES := $(sqlcipher_files)
#LOCAL_STATIC_LIBRARIES := libicui18n libicuuc

#LOCAL_STATIC_LIBRARIES += libcrypto_static
#LOCAL_SHARED_LIBRARIES := libcrypto
LOCAL_STATIC_LIBRARIES += libcrypto_prebuilt

include $(BUILD_STATIC_LIBRARY)
