#!/bin/bash

set -e

: ${ANDROID_TOOLCHAIN_DIR:=/tmp/sqlcipher-android-toolchain}

export PATH=${ANDROID_TOOLCHAIN_DIR}:$PATH
export CC=arm-linux-androideabi-gcc
export CXX=arm-linux-androideabi-g++

export CFLAGS="-DHAVE_USLEEP=1 -DSQLITE_DEFAULT_JOURNAL_SIZE_LIMIT=1048576 \
        -DSQLITE_THREADSAFE=1 -DSQLITE_ENABLE_MEMORY_MANAGEMENT=1 \
        -DSQLITE_TEMP_STORE=3 -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_BACKWARDS \
        -DSQLITE_ENABLE_LOAD_EXTENSION -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_ICU \
        -DSQLITE_ENABLE_RTREE"

export LDFLAGS="-L."

$CC --shared crypto_dummy.c -o ../sqlcipher/libcrypto.so

pushd ../sqlcipher/

./configure --host=x86

rm config.log config.status libtool sqlcipher.pc libcrypto.so

popd

mv ../sqlcipher/Makefile ../sqlcipher/config.h .
