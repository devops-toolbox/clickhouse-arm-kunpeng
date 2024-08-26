#!/bin/bash
#
cp docker/Dockerfile ClickHouse/build-arm64/programs
cp docker/entrypoint.sh ClickHouse/build-arm64/programs
cp -r docker/config ClickHouse/build-arm64/programs/
#cp -r docker/docker-entrypoint-initdb.d ClickHouse/build-arm64/programs
mkdir -p ClickHouse/build-arm64/programs/docker-entrypoint-initdb.d
cd ClickHouse/build-arm64/programs
tar -cvJf ck.tar.xz --exclude=clickhouse-library-bridge --exclude=clickhouse-odbc-bridge clickhouse*
# Add Docker's official GPG key:
# sudo apt-get update -y
# sudo apt-get install -y ca-certificates curl
# sudo install -m 0755 -d /etc/apt/keyrings
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
# sudo chmod a+r /etc/apt/keyrings/docker.asc
# 
# # Add the repository to Apt sources:
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update -y
# sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

### should work on arm machine or use docker buildx to build arm docker image ###
docker build . -t clickhouse:tag
# docker buildx create --name mybuilder --driver docker-container --bootstrap
# docker buildx use mybuilder
# docker buildx build --push --platform linux/arm64 -t harbor.io/clickhouse/clickhouse-server:tag
