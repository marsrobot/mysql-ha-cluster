STOP replica;

CHANGE REPLICATION SOURCE TO SOURCE_HOST='{{TEMPLATE_BIND_ADDRESS_MASTER}}',SOURCE_USER='repl',SOURCE_PASSWORD='password',SOURCE_LOG_FILE='{{TEMPLATE_BINLOG_FILE_MASTER}}',SOURCE_LOG_POS={{TEMPLATE_BINLOG_POSITION_MASTER}};

START REPLICA;

SHOW REPLICA STATUS;