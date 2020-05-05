#!/bin/bash

PG_CRON_VERSION="1.2.0"
PGSQL_HTTP_VERSION="1.3.1"

# Add base-build
apk add libcurl readline bison perl zlib python3
apk add --virtual build-deps --no-cache build-base curl-dev clang llvm postgresql-plpython3 postgresql-plpython3-contrib

mkdir -p /build
cd /build

wget https://github.com/pramsey/pgsql-http/archive/v$PGSQL_HTTP_VERSION.tar.gz
tar xf v$PGSQL_HTTP_VERSION.tar.gz
cd pgsql-http-$PGSQL_HTTP_VERSION
make && make install

cd ..

wget https://github.com/citusdata/pg_cron/archive/v$PG_CRON_VERSION.tar.gz
tar xf v$PG_CRON_VERSION.tar.gz
cd pg_cron-$PG_CRON_VERSION
# Complains for some reason
sed -i 's/ -Werror//' Makefile
make && make install


cp -Rf /usr/share/postgresql/extension/*plpy* /usr/local/share/postgresql/extension/
cp -Rf /usr/lib/postgresql/*plpy* /usr/local/lib/postgresql/
cp -Rf /usr/lib/postgresql/pgxs/src/pl/plpython /usr/local/lib/postgresql/pgxs/src/pl/

cd /
rm -rf /build
apk del build-deps
