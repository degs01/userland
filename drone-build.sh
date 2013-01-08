#!/bin/bash
sudo apt-get install g++-4.6-arm-linux-gnueabi gcc-4.6-arm-linux-gnueabi binutils-arm-linux-gnueabi unzip

wget -O libs.zip https://www.dropbox.com/s/wovdzzxplqjze1o/req_libs.zip?dl=1
unzip libs.zip

rm -rf build
mkdir -p build/arm-android/release/
pushd build/arm-android/release/
cmake -DCMAKE_TOOLCHAIN_FILE=../../../makefiles/cmake/toolchains/drone-linux.cmake -DCMAKE_BUILD_TYPE=Release ../../..
make -j8
popd
