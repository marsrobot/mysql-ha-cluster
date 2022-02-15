#!/bin/bash

echo "********************************************************************************************************"
echo "* On master: Wait for master_start.sh finishing before running replica_start.sh                        *"
echo "* On replica: Run replica_start.sh                                                                     *"
echo "* On master: After replica_start.sh finished, run master_data_create.sh                                *"
echo "********************************************************************************************************"

. ../m1r1_site.sh

. ./master_config_generate.sh

SERVER_ID_MASTER=${TEMPLATE_SERVER_ID_MASTER_0}
BIND_ADDRESS_MASTER=${TEMPLATE_BIND_ADDRESS_MASTER_0}

echo "SERVER_ID_MASTER:" ${SERVER_ID_MASTER}

. ./docker_run.sh

echo "Waiting for MySQL server starting ..."

sleep 120

mysql --user=root --password=${PASSWORD} -h ${BIND_ADDRESS_MASTER} < ${PROJECT_ROOT}/mysql-ha-cluster/deployment/docker/sql/create_replica_user.sql

. ./master_data_create.sh