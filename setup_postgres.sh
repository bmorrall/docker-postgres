#!/bin/bash

USER=${USER:-super}
PASS=${PASS:-$(pwgen -s -1 16)}
DATA_DIR=/data

# Echo out info to later obtain by running `docker logs container_name`
echo "POSTGRES_USER=$USER"
echo "POSTGRES_PASS=$PASS"
echo "POSTGRES_DATA_DIR=$DATA_DIR"
if [ $(env | grep DB) ]; then echo "POSTGRES_DATABASE=$DB";fi

psql --command "CREATE USER $USER WITH SUPERUSER PASSWORD '$PASS';"
createdb -O $USER $USER
