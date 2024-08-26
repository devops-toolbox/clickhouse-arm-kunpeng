#!/usr/bin/bash
#
export CC=clang-16
export CXX=clang++-16
cd ClickHouse
mkdir build
cmake -S . -B build
cmake --build build  # or: `cd build; ninja`
