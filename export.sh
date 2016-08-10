#!/bin/bash
#
# @description
# Script used to perform mongooexport
# mongooexport is the native mongo tool for export ( https://docs.mongodb.com/manual/reference/program/mongoexport/ )
#
# @author bwnyasse
##

set -e

echo "Job Export started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/backup/$MONGO_BACKUP_FILENAME-$DATE.json"

mongoexport --quiet --host $MONGO_HOST:$MONGO_PORT --db $MONGO_DB_NAME --collection $MONGO_COLLECTION_NAME --type json --out $FILE

echo "Job Export finished: $(date)"
