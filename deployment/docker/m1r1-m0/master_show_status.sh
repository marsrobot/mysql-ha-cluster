#!/bin/bash

. ../m1r1_site.sh

SERVER_ID_MASTER=${TEMPLATE_SERVER_ID_MASTER_0}
BIND_ADDRESS_MASTER=${TEMPLATE_BIND_ADDRESS_MASTER_0}

echo "BIND_ADDRESS_MASTER:" $BIND_ADDRESS_MASTER

mysql --user=root --password=${PASSWORD} -h $BIND_ADDRESS_MASTER -e "show slave hosts"

mysql --user=root --password=${PASSWORD} -h $BIND_ADDRESS_MASTER -e "show replicas"