#!/bin/bash

. ../docker_project.sh
. ../mysql_prepare_dirs.sh

sudo docker run -it -d \
    --name $CONTAINER_NAME \
    --env-file ../docker.env \
    --privileged \
    -v ${DATA_DIR}/var/lib/mysql-files:/var/lib/mysql-files:rw \
    -v ${DATA_DIR}/var/lib/mysql:/var/lib/mysql:rw \
    -v ${DATA_DIR}/var/log/mysql:/var/log/mysql:rw \
    --restart unless-stopped \
    -p 0.0.0.0:3306:3306 \
    mysql:8.0.27 \
    mysqld \
    --binlog-ignore-db=information_schema \
    --binlog-ignore-db=mysql \
    --binlog-ignore-db=performance_schema \
    --binlog-ignore-db=sys \
    --default-authentication-plugin=mysql_native_password \
    --log-bin=binlog.log \
    --server-id=${SERVER_ID_MASTER} \
    --binlog_expire_logs_seconds=0 \
    --innodb_buffer_pool_instances=1 \
    --innodb_buffer_pool_size=4096M \
    --innodb_file_per_table=ON \
    --innodb_flush_log_at_trx_commit=1 \
    --innodb_flush_method=O_DIRECT \
    --innodb_log_file_size=128MB \
    --innodb_read_io_threads=8 \
    --innodb_write_io_threads=4
