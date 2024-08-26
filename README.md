kunpeng arm64 is base on arm v8.2 but not have sse4.2 and rcpc

but clickhouse default use this cpu features,can't work on kunpeng 920

So we must from source code and replace some config to rebuild

# Step

1. init build environment

init.sh

2. get clickhouse repo and library

repo.sh

3. build binary from repo(linux/amd64,default is current platform)

build.sh

4. build binary from repo (linux/arm64 cross build on linux/amd64)

build-arm.sh

5. make docker image like clickhouse/clickhouse-server

make-docker.sh
