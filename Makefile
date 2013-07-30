
.DEFAULT_GOAL := all
LIBRARY_ROOT := libs
JNI_DIR := ${CURDIR}/jni
EXTERNAL_DIR := ${CURDIR}/external
SQLCIPHER_DIR := ${EXTERNAL_DIR}/sqlcipher
LICENSE := SQLCIPHER_LICENSE
ASSETS_DIR := assets
LATEST_TAG := $(shell git tag | sort -r | head -1)
SECOND_LATEST_TAG := $(shell git tag | sort -r | head -2 | tail -1)
RELEASE_DIR := "SQLCipher for Android ${LATEST_TAG}"
CHANGE_LOG_HEADER := "Changes included in the ${LATEST_TAG} release of SQLCipher for Android:"
README := ${RELEASE_DIR}/README

CPP_RUNTIME_SO := libstlport_shared.so
EXTERNAL_LIBS := libsqlcipher_android.so libspatialite.so

NDK_BUILD_FLAGS ?= -j5

init:
	git submodule update --init
	android update project -p .

all: build-external build-jni build-java copy-libs

build-external:
	cd ${EXTERNAL_DIR} && \
	ndk-build build-local-hack && \
	ndk-build ${NDK_BUILD_FLAGS}

build-jni:
	cd ${JNI_DIR} && \
	ndk-build ${NDK_BUILD_FLAGS}

build-java:
	ant release && \
	cd ${CURDIR}/bin/classes && \
	jar -cvf sqlcipher.jar .

release:
	-rm -rf ${RELEASE_DIR}
	-rm ${RELEASE_DIR}.zip
	mkdir ${RELEASE_DIR}
	cp -R ${LIBRARY_ROOT} ${RELEASE_DIR}
	cp -R ${ASSETS_DIR} ${RELEASE_DIR}
	cp ${LICENSE} ${RELEASE_DIR}
	printf "%s\n\n" ${CHANGE_LOG_HEADER} > ${README}
	git log --pretty=format:' * %s' ${SECOND_LATEST_TAG}..${LATEST_TAG} >> ${README}
	zip -r ${RELEASE_DIR}.zip ${RELEASE_DIR}
	rm -rf ${RELEASE_DIR}

clean:
	-rm SQLCipher\ for\ Android\*.zip
	ant clean
	cd ${EXTERNAL_DIR} && ndk-build clean
	-cd ${SQLCIPHER_DIR} && make clean
	cd ${JNI_DIR} && ndk-build clean
	-for _arch in armeabi armeabi-v7a x86; do \
	    rm $(addprefix ${LIBRARY_ROOT}/$$_arch/, ${EXTERNAL_LIBS}); \
	done

copy-libs:
	cp ${CURDIR}/bin/classes/sqlcipher.jar ${LIBRARY_ROOT}
	for _arch in armeabi armeabi-v7a x86; do \
	    install -p $(addprefix ${EXTERNAL_DIR}/libs/$$_arch/, \
	    	${EXTERNAL_LIBS}) ${LIBRARY_ROOT}/$$_arch/; \
	done

copy-libs-dist:
	cp ${LIBRARY_ROOT}/*.jar dist/SQLCipherForAndroid-SDK/libs/ && \
	cp ${LIBRARY_ROOT}/armeabi/*.so dist/SQLCipherForAndroid-SDK/libs/armeabi/
