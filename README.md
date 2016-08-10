# docker-mongodb-worker
Docker image that provides capability :
- to perform native Mongodb binary and data import/export
- backup dump of the database

## Description

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

<pre>
docker run \
      -v YOUR_PATH/:/tmp/mongodb/  \
      -e MONGO_HOST='your_host_value' \
      -e MONGO_PORT='your_port_value' \
      -e MONGO_DB_NAME='your_db_name' \
      -e MONGO_COLLECTION_NAME='your_collection_name' \
      bwnyasse/docker-mongodb-worker \
      /start.sh -i
</pre>

### Export

- With cron

<pre>
  docker run \
        -e MONGO_HOST='your_host_value' \
        -e MONGO_PORT='your_port_value' \
        -e MONGO_DB_NAME='your_db_name' \
        -e MONGO_COLLECTION_NAME='your_collection_name' \
        -e CRON_SCHEDULE='your_cron_schedule' \
        -e MONGO_BACKUP_FILENAME='your_backup_filename_without_extension' \
        bwnyasse/docker-mongodb-worker \
        /start.sh -e cron
</pre>

- Without cron ( direct export)

<pre>
docker run \
      -e MONGO_HOST='your_host_value' \
      -e MONGO_PORT='your_port_value' \
      -e MONGO_DB_NAME='your_db_name' \
      -e MONGO_COLLECTION_NAME='your_collection_name' \
      -e MONGO_BACKUP_FILENAME='your_backup_filename_without_extension' \
      bwnyasse/docker-mongodb-worker \
      /start.sh -e no-cron
</pre>

### Dump

- With cron

<pre>
docker run \
      -e MONGO_HOST='your_host_value' \
      -e MONGO_PORT='your_port_value' \
      -e CRON_SCHEDULE='your_cron_schedule' \
      -e MONGO_BACKUP_FILENAME='your_backup_filename_without_extension' \
      bwnyasse/docker-mongodb-worker \
      /start.sh -d cron
</pre>

- Without cron ( direct dump)

<pre>
docker run \
      -e MONGO_HOST='your_host_value' \
      -e MONGO_PORT='your_port_value' \
      -e MONGO_BACKUP_FILENAME='your_backup_filename_without_extension' \
      bwnyasse/docker-mongodb-worker \
      /start.sh -d no-cron
</pre>

## Example


Easy to use with docker-compose , check the [example]()
