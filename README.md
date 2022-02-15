# mysql-ha-cluster

# Purpose
- Set up a MySQL master-replica cluster

# Features
- A master instance can replicate to one or multiple replicas.
- There is no replication between master instances.
- If the data is sharded on multiple master instances, this provides a scalable and safe MySQL storage solution.
- The topology is encoded as m1rn, which means 1 master and n replicas for each master.
- Multiple replicas can be added relatively easily.

# Setup and Steps
- Clone the code to /srv/mysql-ha-cluster
- The IP of master instance is set by environment variable MASTER_IP in mysql-ha-cluster/.env file (echo "export MASTER_IP=10.0.0.5" > .env)
- The IP of the first replica instance is 10.0.100.64. You can change it at deployment/docker/server/master_setup_user.sh
- On master: at deployment/docker/m1r1-m0 (the master directory), run ./docker_run.sh to start the master instance.
- On replica: at deployment/docker/m1r1-r0 (the replica directory), run ./docker_run.sh to start the first replica instance.
- On master: at deployment/docker/m1r1-m0, run ./master_start.sh
- On master: Wait for master_start.sh finishing before running ./replica_start.sh at deployment/docker/m1r1-r0
- On replica: at deployment/docker/m1r1-r0, run replica_start.sh
- On master: After replica_start.sh finished, run master_data_create.sh
- Finally, when you modify databases on the master instance, data will be replicated to the replicas.

# Enhancements
- Support multiple replicas more flexibly
- Support monitoring and automatic failover.
- Support tuning the trade-off between writing performance and data persistence safety.