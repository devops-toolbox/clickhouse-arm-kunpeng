#!/bin/bash
#
cp Dockerfile ClickHouse/build-arm64/programs
cd ClickHouse/build-arm64/programs
tar -cvJf ck.tar.xz clickhouse* --exclude=clickhouse-library-bridge --exclude=clickhouse-odbc-bridge
docker build . -t clickhouse:tag

