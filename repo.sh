#!/usr/bin/bash
#
TAG="v23.8.7.24-lts"
git clone https://github.com/ClickHouse/ClickHouse.git
cd ClickHouse
git checkout $TAG
git submodule init
git submodule update
