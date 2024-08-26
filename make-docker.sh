#!/bin/bash
#
cp docker/Dockerfile ClickHouse/build-arm64/programs
cp docker/entrypoint.sh ClickHouse/build-arm64/programs
cp -r docker/config/* ClickHouse/build-arm64/programs
cp -r docker/docker-entrypoint-initdb.d ClickHouse/build-arm64/programs
cd ClickHouse/build-arm64/programs
tar -cvJf ck.tar.xz clickhouse* --exclude=clickhouse-library-bridge --exclude=clickhouse-odbc-bridge
docker build . -t clickhouse:tag

