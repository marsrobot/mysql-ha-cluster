#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "SCRIPT_DIR:" $SCRIPT_DIR

sudo docker stop ${CONTAINER_NAME}
sudo docker rm -f ${CONTAINER_NAME}

export MY_HOST_NAME=`hostname`

echo "Reset MySQL master server ..."

export DATA_DIR="/local"

sudo rm -rf ${DATA_DIR}/var/lib/mysql
sudo rm -rf ${DATA_DIR}/var/lib/mysql-files
sudo rm -rf ${DATA_DIR}/var/log/mysql

sudo /bin/ls -l ${DATA_DIR}/var/lib/mysql/
sudo /bin/ls -l ${DATA_DIR}/var/lib/mysql-files/
sudo /bin/ls -l ${DATA_DIR}/var/log/mysql/