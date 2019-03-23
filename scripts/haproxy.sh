#!/bin/bash
set -ex
set -o pipefail

# remove default config
sudo rm -v /etc/haproxy/haproxy.cfg

# copy new config
sudo cp ./haproxy.cfg /etc/haproxy/haproxy.cfg

#start the server
sudo systemctl restart haproxy

