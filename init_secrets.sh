#!/usr/bin/env bash

random-string()
{
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

set +x

DB_ROOT_PASSWORD=`random-string`
DB_PASSWORD=`random-string`
ENV_SECRET=`random-string`

cp .env `date +"%Y%m%d_%H%M%S"`.env

sed \
    -e "s/DB_ROOT_PASSWORD=.*/DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}/" \
    -e "s/DB_PASSWORD=.*/DB_PASSWORD=${DB_PASSWORD}/" \
    -e "s/ENV_SECRET=.*/ENV_SECRET=${ENV_SECRET}/" \
    env-base > .env
