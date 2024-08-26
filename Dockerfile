FROM ubuntu:20.04
ADD clickhouse.tar.xz /usr/bin
COPY config/clickhouse-server /etc/clickhouse-server
COPY config/clickhouse-client /etc/clickhouse-client
COPY config/clickhouse-keeper /etc/clickhouse-keeper
COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY entrypoint.sh /entrypoint.sh
RUN echo '#!/bin/sh' > /usr/sbin/policy-rc.d && \
    echo 'exit 101' >> /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d && \
    mkdir -p /RUN/systemd && echo 'docker' > /RUN/systemd/container &&\
    apt-get update -y && apt-get install --allow-unauthenticated --yes --no-install-recommends gosu &&\
    rm -rf /var/lib/apt/lists/* /var/cache/debconf /tmp/* && apt-get clean
RUN mkdir /var/lib/clickhouse &&\
    chmod +x /entrypoint.sh /usr/sbin/gosu &&\
    groupadd -r clickhouse --gid=101 && useradd -r -g clickhouse --uid=101 --home-dir=/var/lib/clickhouse --shell=/bin/bash clickhouse &&\
    chmod -R 755 /etc/clickhouse-server/ && chmod -R 755 /etc/clickhouse-client/
EXPOSE 8123 9000 9009
VOLUME [/var/lib/clickhouse]

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV TZ=UTC
ENV CLICKHOUSE_CONFIG=/etc/clickhouse-server/config.xml
ENTRYPOINT ["/entrypoint.sh"]
