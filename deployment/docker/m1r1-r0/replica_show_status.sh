#!/bin/bash

. ../m1r1_site.sh

SERVER_ID_REPLICA=${TEMPLATE_SERVER_ID_REPLICA_0}
BIND_ADDRESS_MASTER=${TEMPLATE_BIND_ADDRESS_MASTER_0}
BIND_ADDRESS_REPLICA=${TEMPLATE_BIND_ADDRESS_REPLICA_0}

echo "SERVER_ID_REPLICA:" $SERVER_ID_REPLICA

mysql --user=root --password=${PASSWORD} -h $BIND_ADDRESS_REPLICA -e "SHOW VARIABLES LIKE 'server_id'"

mysql --user=root --password=${PASSWORD} -h $BIND_ADDRESS_REPLICA -e "SHOW REPLICA STATUS"

mysql --user=root --password=${PASSWORD} -h $BIND_ADDRESS_REPLICA -e "select * from performance_schema.replication_applier_status_by_worker"