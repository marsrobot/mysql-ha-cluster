#!/bin/bash

. ./replica_config_generate.sh

. ../m1r1_site.sh

SERVER_ID_REPLICA=${TEMPLATE_SERVER_ID_REPLICA_0}
BIND_ADDRESS_REPLICA=${TEMPLATE_BIND_ADDRESS_REPLICA_0}

echo "SERVER_ID_REPLICA:" $SERVER_ID_REPLICA
echo "BIND_ADDRESS_REPLICA:" $BIND_ADDRESS_REPLICA

. ./docker_run.sh

sleep 180

mysql --user=root --password=${PASSWORD} -h $BIND_ADDRESS_REPLICA < ${PROJECT_ROOT}/mysql-ha-cluster/deployment/docker/sql/create_replica_user.sql