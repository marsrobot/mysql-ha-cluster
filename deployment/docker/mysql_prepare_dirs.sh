#!/bin/bash

sudo systemctl stop mysqld
sudo systemctl disable mysqld

sudo docker stop ${CONTAINER_NAME}
sudo docker rm -f ${CONTAINER_NAME}

sudo iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
sudo iptables -I INPUT -p udp --dport 3306 -j ACCEPT

export MY_HOST_NAME=`hostname`

echo "Hostname: " "${MY_HOST_NAME}"

export DATA_DIR="/local"

echo "Data directory: " ${DATA_DIR}/var/lib/mysql

sudo mkdir -p ${DATA_DIR}/var/lib/mysql
sudo mkdir -p ${DATA_DIR}/var/lib/mysql-files
sudo mkdir -p ${DATA_DIR}/var/log/mysql

sudo chown -R user ${DATA_DIR}/var/lib/mysql
sudo chown -R user ${DATA_DIR}/var/lib/mysql-files
sudo chown -R user ${DATA_DIR}/var/log/mysql

sudo chmod -R 777 ${DATA_DIR}/var/lib/mysql
sudo chmod -R 777 ${DATA_DIR}/var/lib/mysql-files
sudo chmod -R 777 ${DATA_DIR}/var/log/mysql

sudo docker pull mysql:8.0.27

# enable password authentication for root
# https://stackoverflow.com/questions/49019652/not-able-to-connect-to-mysql-docker-from-local

echo "Listing ${DATA_DIR}/var/lib/mysql ..."
sudo /bin/ls -la ${DATA_DIR}/var/lib/mysql

echo "Listing ${DATA_DIR}/var/log/mysql ..."
sudo /bin/ls -la ${DATA_DIR}/var/log/mysql