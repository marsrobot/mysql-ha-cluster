export PROJECT_ROOT=/srv

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. $PROJECT_ROOT/mysql-ha-cluster/deployment/docker/.env

REPLICA_IP=`ip a | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*'  | grep '^10.'`

export PASSWORD=password
export TEMPLATE_SERVER_ID_MASTER_0=10
export TEMPLATE_BIND_ADDRESS_MASTER_0=${MASTER_IP}
export TEMPLATE_SERVER_ID_REPLICA_0=1000
export TEMPLATE_BIND_ADDRESS_REPLICA_0=${REPLICA_IP}