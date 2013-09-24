LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	net_sqlcipher_database_SQLiteCompiledSql.cpp \
	net_sqlcipher_database_SQLiteDatabase.cpp \
	net_sqlcipher_database_SQLiteProgram.cpp \
	net_sqlcipher_database_SQLiteQuery.cpp \
	net_sqlcipher_database_SQLiteStatement.cpp \
	net_sqlcipher_CursorWindow.cpp \
	CursorWindow.cpp
#	net_sqlcipher_database_sqlcipher_SQLiteDebug.cpp

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/include \

LOCAL_STATIC_LIBRARIES := \
    libicuuc_static \
    libsqlcipher_android \
    libnativehelper_static \
    libspatialite

# libs from the NDK
LOCAL_LDLIBS += -ldl -llog

LOCAL_LDLIBS += -landroid_runtime -lbinder -lutils -lcutils

LOCAL_MODULE:= libdatabase_sqlcipher

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android-liblog)
$(call import-module,android-openssl)
$(call import-module,android-platform)
$(call import-module,android-sqlite)
$(call import-module,icu4c)
$(call import-module,libnativehelper)
$(call import-module,sqlcipher)
$(call import-module,geos)
$(call import-module,libspatialite)
$(call import-module,proj.4)
