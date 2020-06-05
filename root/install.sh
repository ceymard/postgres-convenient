#!/bin/bash

# PG_CRON_VERSION="1.2.0"
PGSQL_HTTP_VERSION="1.3.1"

apt update
apt -y install postgresql-11-cron build-essential wget libcurl4-openssl-dev postgresql-server-dev-11 postgresql-plpython3-11 python3 python3-pip

mkdir -p /build
cd /build

wget https://github.com/pramsey/pgsql-http/archive/v$PGSQL_HTTP_VERSION.tar.gz
tar xf v$PGSQL_HTTP_VERSION.tar.gz
cd pgsql-http-$PGSQL_HTTP_VERSION
make && make install

cd /
rm -rf /build
apt -y remove postgresql-server-dev-11 wget build-essential
apt -y auto-remove
