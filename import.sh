#!/bin/bash
#
# @description
# Script used to perform mongoimport
# mongoimport is the native mongo tool for import ( https://docs.mongodb.com/manual/reference/program/mongoimport/ )
#
# @author bwnyasse
##

set -e

echo "Job Import started: $(date)"

mongoimport --quiet --host $MONGO_HOST:$MONGO_PORT --db $MONGO_DB_NAME --collection $MONGO_COLLECTION_NAME --type json --drop --file /tmp/mongodb/import.json --jsonArray

echo "Job Import finished: $(date)"
