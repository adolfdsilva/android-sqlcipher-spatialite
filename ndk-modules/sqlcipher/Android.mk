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

SPATIALITE_SQLITE_CFLAGS := \
	-DSQLITE_ENABLE_FTS4 \
	-DSQLITE_ENABLE_ICU \
	-DSQLITE_ENABLE_RTREE

# how on earth to you make this damn Android build system run cmd line progs?!?!
build-local-hack: sqlcipher/sqlite3.c

sqlcipher/sqlite3.c:
	cp $(CURDIR)/config/Makefile $(CURDIR)/config/config.h $(CURDIR)/sqlcipher/
	make -C sqlcipher sqlite3.c

#------------------------------------------------------------------------------#
# libsqlite3

sqlcipher_files := \
	sqlcipher/sqlite3.c

sqlcipher_cflags := -DSQLITE_HAS_CODEC -DHAVE_FDATASYNC=0
#sqlite_visibility_cflags :=  \
	-DSQLITE_API='__attribute__ ((visibility ("default")))'

include $(CLEAR_VARS)

LOCAL_CFLAGS += \
		$(ANDROID_SQLITE_CFLAGS) \
		$(SPATIALITE_SQLITE_CFLAGS) \
		$(sqlcipher_cflags) \
		-Dfdatasync=fsync \
		-fvisibility=hidden \
		-DNDEBUG=1 \
		$(sqlite_visibility_cflags)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/sqlcipher
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sqlcipher
LOCAL_EXPORT_CFLAGS += \
		$(ANDROID_SQLITE_CFLAGS) \
		$(SPATIALITE_SQLITE_CFLAGS) \
		$(sqlcipher_cflags) \
		$(sqlite_visibility_cflags)

LOCAL_MODULE    := libsqlcipher
LOCAL_SRC_FILES := $(sqlcipher_files)
LOCAL_STATIC_LIBRARIES := libicui18n libicuuc
LOCAL_STATIC_LIBRARIES += libcrypto_static

include $(BUILD_STATIC_LIBRARY)
