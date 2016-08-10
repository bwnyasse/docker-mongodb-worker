#!/bin/bash
#
# @description
# Script used to perform mongodump
# mongodump is the native mongo tool for dump ( https://docs.mongodb.com/manual/reference/program/mongodump/ )
#
# @author bwnyasse
##

set -e

echo "Job Dump started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/backup/$MONGO_BACKUP_FILENAME-$DATE.tar.gz"
OUTPUT="dump/"

mongodump --quiet --host $MONGO_HOST:$MONGO_PORT --out $OUTPUT
tar -zcvf $FILE $OUTPUT
rm -rf $OUTPUT

echo "Job Dump finished: $(date)"
