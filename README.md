# docker-mongodb-worker
Docker image that provides capability :
- to perform native Mongodb binary and data **import/export**
- backup **dump** of the database

## Description

### Parameters


    MONGO_HOST              the host/ip of your mongodb database
    MONGO_PORT              the port number of your mongodb database
    MONGO_DB_NAME           the database name
    MONGO_COLLECTION_NAME   the database collection to work on, according to the MONGO_DB_NAME provided
    MONGO_BACKUP_FILENAME   the name of the generated file
    CRON_SCHEDULE           the interval of cron job to run mongodump


In order to specify the willing action, you must override the default docker command. The running container requires the following environments variables :

- Require for every jobs:
  - MONGO_HOST, MONGO_PORT


- Require for Export :
  - MONGO_DB_NAME, MONGO_COLLECTION_NAME, MONGO_BACKUP_FILENAME


- Require for Import:
  - MONGO_DB_NAME, MONGO_COLLECTION_NAME


- Require for Dump:
  - MONGO_BACKUP_FILENAME

## Usage

This container is designed to perform operations on a running mongoDB instance.

### Import

To import json data, this container assumed that the filename is **import.json**.

If **YOUR_PATH/import.json** is the location of the import file :

          docker run \
                -v YOUR_PATH/:/tmp/mongodb/  \
                -e MONGO_HOST=your_host_value \
                -e MONGO_PORT=your_port_value \
                -e MONGO_DB_NAME=your_db_name \
                -e MONGO_COLLECTION_NAME=your_collection_name \
                bwnyasse/docker-mongodb-worker \
                /start.sh -i


### Export

- With cron


          docker run \
                -e MONGO_HOST=your_host_value \
                -e MONGO_PORT=your_port_value \
                -e MONGO_DB_NAME=your_db_name \
                -e MONGO_COLLECTION_NAME=your_collection_name \
                -e CRON_SCHEDULE=your_cron_schedule \
                -e MONGO_BACKUP_FILENAME=your_backup_filename_without_extension \
                bwnyasse/docker-mongodb-worker \
                /start.sh -e cron


- Without cron ( direct export)


          docker run \
                -e MONGO_HOST=your_host_value \
                -e MONGO_PORT=your_port_value \
                -e MONGO_DB_NAME=your_db_name \
                -e MONGO_COLLECTION_NAME=your_collection_name \
                -e MONGO_BACKUP_FILENAME=your_backup_filename_without_extension \
                bwnyasse/docker-mongodb-worker \
                /start.sh -e no-cron


### Dump

- With cron


          docker run \
                -e MONGO_HOST=your_host_value \
                -e MONGO_PORT=your_port_value \
                -e CRON_SCHEDULE=your_cron_schedule \
                -e MONGO_BACKUP_FILENAME=your_backup_filename_without_extension \
                bwnyasse/docker-mongodb-worker \
                /start.sh -d cron


- Without cron ( direct dump)


          docker run \
                -e MONGO_HOST=your_host_value \
                -e MONGO_PORT=your_port_value \
                -e MONGO_BACKUP_FILENAME=your_backup_filename_without_extension \
                bwnyasse/docker-mongodb-worker \
                /start.sh -d no-cron


### Backup Data

 For export and dump ,the backup data will be hosted into **/backup/**

## Example


Easy to use with docker-compose , go into the [example](https://github.com/bwnyasse/docker-mongodb-worker/tree/master/example)

- run **docker-compose -f example.yml**
- Every minute, we will see a .json file and a .tar from export and dump into  **example/data/** directory  
