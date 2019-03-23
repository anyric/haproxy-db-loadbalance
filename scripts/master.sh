#!/bin/bash
set -ex
set -o pipefail

# create replication user
sudo -u postgres psql -c "CREATE USER replica REPLICATION;"

# replace pg_hba.conf file
sudo rm -v /etc/postgresql/9.6/main/pg_hba.conf
sudo cp ./pg_hba.conf /etc/postgresql/9.6/main/pg_hba.conf

# replace the postgresql.conf file
sudo cp ./postgresql.conf /etc/postgresql/9.6/main/postgresql.conf

# create directory for archive 
sudo mkdir -p /var/lib/postgresql/9.6/main/archive/
sudo chmod 700 /var/lib/postgresql/9.6/main/archive/
sudo chown -R postgres:postgres /var/lib/postgresql/9.6/main/archive/

# restart postgresql service
sudo systemctl restart postgresql

