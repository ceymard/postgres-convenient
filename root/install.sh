#!/bin/bash

PG_CRON_VERSION="1.3.0"
PGSQL_HTTP_VERSION="1.3.1"

apk update
apk add clang build-base git llvm10 curl-dev
apk add postgresql-plpython3 libcurl ca-certificates py3-pip

cd /usr/local/share/postgresql/extension/
ln -sf /usr/share/postgresql/extension/plpython3u* .
cd /usr/local/lib/postgresql
ln -sf /usr/lib/postgresql/plpython* .
cd /

mkdir -p /build
cd /build

wget https://github.com/pramsey/pgsql-http/archive/v$PGSQL_HTTP_VERSION.tar.gz
tar xf v$PGSQL_HTTP_VERSION.tar.gz
cd pgsql-http-$PGSQL_HTTP_VERSION
make && make install

cd /build
git clone --depth 1 --branch v$PG_CRON_VERSION https://github.com/citusdata/pg_cron.git
cd pg_cron
sed -i 's/-Werror //g' Makefile
make && make install


cd /
rm -rf /build
apk del build-base clang llvm10 git curl-dev
rm -f /var/cache/apk/*
