
.DEFAULT_GOAL := all
LIBRARY_ROOT := libs
JNI_DIR := ${CURDIR}/jni
EXTERNAL_DIR := ${CURDIR}/external
SQLCIPHER_DIR := ${EXTERNAL_DIR}/sqlcipher
CPP_RUNTIME_SO := libstlport_shared.so
NDK_BUILD_FLAGS := -j5

init:
	git submodule update --init
	android update project -p .

all: build-external build-jni build-java copy-libs

build-external:
	cd ${EXTERNAL_DIR} && \
	ndk-build build-local-hack && \
	ndk-build ${NDK_BUILD_FLAGS} && \
	ndk-build copy-libs-hack

build-jni:
	cd ${JNI_DIR} && \
	ndk-build ${NDK_BUILD_FLAGS}

build-java:
	ant release && \
	cd ${CURDIR}/bin/classes && \
	jar -cvf sqlcipher.jar .

clean:
	ant clean
	cd ${EXTERNAL_DIR} && ndk-build clean
	-cd ${SQLCIPHER_DIR} && make clean
	cd ${JNI_DIR} && ndk-build clean
	-rm ${LIBRARY_ROOT}/armeabi/libsqlcipher_android.so
	-rm ${LIBRARY_ROOT}/armeabi/libdatabase_sqlcipher.so
	-rm ${LIBRARY_ROOT}/armeabi/${CPP_RUNTIME_SO}
	-rm ${LIBRARY_ROOT}/armeabi/libspatialite.so
	-rm ${LIBRARY_ROOT}/sqlcipher.jar
	-rm ${LIBRARY_ROOT}/x86/libsqlcipher_android.so
	-rm ${LIBRARY_ROOT}/x86/libdatabase_sqlcipher.so
	-rm ${LIBRARY_ROOT}/x86/${CPP_RUNTIME_SO}
	-rm ${LIBRARY_ROOT}/x86/libspatialite.so

copy-libs:
	mkdir -p ${LIBRARY_ROOT}/armeabi
	cp ${EXTERNAL_DIR}/libs/armeabi/libsqlcipher_android.so \
		 ${LIBRARY_ROOT}/armeabi  && \
	cp ${EXTERNAL_DIR}/libs/armeabi/libspatialite.so \
		 ${LIBRARY_ROOT}/armeabi  && \
	cp ${JNI_DIR}/libs/armeabi/libdatabase_sqlcipher.so \
		${LIBRARY_ROOT}/armeabi && \
	cp ${CURDIR}/bin/classes/sqlcipher.jar ${LIBRARY_ROOT} && \
	cp $(JNI_DIR)/libs/armeabi/${CPP_RUNTIME_SO} ${LIBRARY_ROOT}/armeabi && \
	mkdir -p ${LIBRARY_ROOT}/armeabi-v7a && \
	cp ${EXTERNAL_DIR}/libs/armeabi-v7a/libsqlcipher_android.so \
		 ${LIBRARY_ROOT}/armeabi-v7a  && \
	cp ${EXTERNAL_DIR}/libs/armeabi-v7a/libspatialite.so \
		 ${LIBRARY_ROOT}/armeabi-v7a  && \
	cp ${JNI_DIR}/libs/armeabi-v7a/libdatabase_sqlcipher.so \
		${LIBRARY_ROOT}/armeabi-v7a && \
	cp $(JNI_DIR)/libs/armeabi-v7a/${CPP_RUNTIME_SO} ${LIBRARY_ROOT}/armeabi-v7a && \
	mkdir -p ${LIBRARY_ROOT}/x86 && \
	cp ${EXTERNAL_DIR}/libs/x86/libsqlcipher_android.so \
		 ${LIBRARY_ROOT}/x86  && \
	cp ${EXTERNAL_DIR}/libs/x86/libspatialite.so \
		 ${LIBRARY_ROOT}/x86  && \
	cp ${JNI_DIR}/libs/x86/libdatabase_sqlcipher.so \
		${LIBRARY_ROOT}/x86 && \
	cp $(JNI_DIR)/libs/x86/${CPP_RUNTIME_SO} ${LIBRARY_ROOT}/x86

copy-libs-dist:
	cp ${LIBRARY_ROOT}/*.jar dist/SQLCipherForAndroid-SDK/libs/ && \
	cp ${LIBRARY_ROOT}/armeabi/*.so dist/SQLCipherForAndroid-SDK/libs/armeabi/
