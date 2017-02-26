#!/usr/bin/env bash

random-string()
{
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

set +x

DB_ROOT_PASSWORD=`random-string`
DB_PASSWORD=`random-string`
ENV_SECRET=`random-string`

cp env.sh `date +"%Y%m%d_%H%M%S"`_env.sh

sed -e "s/MYSQL_ROOT_PASSWORD=.*/MYSQL_ROOT_PASSWORD=${DB_ROOT_PASSWORD}/" \
    -e "s/POSTGRES_PASSWORD=.*/POSTGRES_PASSWORD=${DB_ROOT_PASSWORD}/" \
    -e "s/SYMFONY__ENV__DATABASE_PASSWORD=.*/SYMFONY__ENV__DATABASE_PASSWORD=${DB_PASSWORD}/" \
    -e "s/SYMFONY__ENV__SECRET=.*/SYMFONY__ENV__SECRET=${ENV_SECRET}/" \
    -i env.sh
