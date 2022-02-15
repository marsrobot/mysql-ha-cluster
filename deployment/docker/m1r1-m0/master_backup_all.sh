. ../m1r1_site.sh

BIND_ADDRESS_MASTER=${TEMPLATE_BIND_ADDRESS_MASTER_0}

echo "BIND_ADDRESS_MASTER: " $BIND_ADDRESS_MASTER

mysqldump --user=root --password=${PASSWORD} -h ${BIND_ADDRESS_MASTER} \
    --events \
    --flush-logs \
    --include-source-host-port \
    --routines \
    --single-transaction \
    --source-data=2 \
    --triggers \
    --all-databases > /tmp/backup_all.sql