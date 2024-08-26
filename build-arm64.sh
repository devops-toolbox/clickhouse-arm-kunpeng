#!/usr/bin/bash
#
export CC=clang-16
export CXX=clang++-16
cd ClickHouse
rm -rf cmake/toolchain/linux-aarch64 && mkdir cmake/toolchain/linux-aarch64 -p
wget 'https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz?revision=2e88a73f-d233-4f96-b1f4-d8b36e9bb0b9&la=en' -O gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz
tar xJf gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz -C cmake/toolchain/linux-aarch64 --strip-components=1
rm -rf build-arm64 && mkdir build-arm64 -p
sed -i 's#set (COMPILER_FLAGS "${COMPILER_FLAGS} -march=armv8.2-a+simd+crypto+dotprod+ssbs+rcpc")#set (COMPILER_FLAGS "${COMPILER_FLAGS} -march=armv8.2-a+fp+simd+crc+lse  -mtune=tsv110 -fPIC ")#' cmake/cpu_features.cmake

cmake -DCMAKE_TOOLCHAIN_FILE=cmake/linux/toolchain-aarch64.cmake -DCMAKE_BUILD_TYPE=RELEASE -DHAVE_SSE41=0 -DHAVE_SSE42=0 -S . -B build-arm64 
cmake --build build-arm64 
#cd build-arm64 && ninja
# SSE 4.2 Support
#cmake  . -Bbuild-arm64 -DCMAKE_TOOLCHAIN_FILE=cmake/linux/toolchain-aarch64.cmake -D ENABLE_MYSQL=1  -D ENABLE_PROTOBUF=1 -D ENABLE_GRPC=1



