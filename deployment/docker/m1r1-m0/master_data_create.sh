#!/bin/bash

. ../m1r1_site.sh

BIND_ADDRESS_MASTER=${TEMPLATE_BIND_ADDRESS_MASTER_0}

echo "BIND_ADDRESS_MASTER:" $BIND_ADDRESS_MASTER

mysql --user=root --password=${PASSWORD} -h $BIND_ADDRESS_MASTER < ${PROJECT_ROOT}/mysql-ha-cluster/deployment/docker/sql/master_create_database.sql

mysql --user=root --password=${PASSWORD} -h $BIND_ADDRESS_MASTER < ${PROJECT_ROOT}/mysql-ha-cluster/deployment/docker/sql/master_create_table.sql
