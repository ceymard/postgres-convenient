#!/bin/bash

cat >> "$PGDATA/postgresql.conf" << EOF
shared_preload_libraries = 'pg_cron'
cron.database_name = '${POSTGRES_DATABASE-$POSTGRES_USER}'
EOF
