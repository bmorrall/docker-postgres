#!/bin/bash
DATA_DIR=/data

# test if DATA_DIR has content
if [[ ! "$(ls -A $DATA_DIR)" ]]; then
    echo "Initializing PostgreSQL at $DATA_DIR"

    # Copy the data that we generated within the container to the empty DATA_DIR.
    cp -R /var/lib/postgresql/9.3/main/* $DATA_DIR

    # Ensure postgres owns the DATA_DIR
    chown -R postgres $DATA_DIR
    # Ensure we have the right permissions set on the DATA_DIR
    chmod -R 700 $DATA_DIR
fi

/usr/lib/postgresql/9.3/bin/postgres -D /apps/pgdata -c config_file=/etc/postgresql/9.3/main/postgresql.conf