#!/bin/bash

set -ex
set -o pipefail

# install postgresql server
sudo apt-get update && apt-get install -y vim wget
sudo su -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main "  >> /etc/apt/sources.list.d/pgdg.list'
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
sudo apt-get update && apt-get install -y postgresql-9.6 postgresql-client-9.6
