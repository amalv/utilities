#!/bin/bash
# usage: drupal-quick-dump user host database

USER="$1"
HOST="$2"
DB="$3"
DATE=`date +%M_%H_%d_%m_%Y`

# Get User Password
echo "Please provide the password for ${USER} on db ${DB} hosted at ${HOST}:"
read -se PASS

# Dump Structure
echo "Starting to dump the table structure."
TABLES=`mysql --skip-column-names -e 'show tables' -u ${USER} -p${PASS} -h ${HOST} ${DB}`
mysqldump --complete-insert --disable-keys --single-transaction --no-data -u ${USER} --password=${PASS} -h ${HOST} ${DB} ${TABLES} > ${DB}.${DATE}.sql

# Dump Data, Excluding Certain Tables
echo "Starting to dump the table data."
TABLES2=`echo "$TABLES" | grep -Ev "^(accesslog|cache.*|flood|search_.*|semaphore|sessions|watchdog)$"`
mysqldump --complete-insert --disable-keys --single-transaction --no-create-info -u ${USER} --password=${PASS} -h ${HOST} ${DB} ${TABLES2} >> ${DB}.${DATE}.sql

echo "Starting to gzip dump."
gzip -v ${DB}.${DATE}.sql

echo "Done!"
