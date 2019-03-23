#!/bin/bash

set -e
set -o pipefail

sudo apt-get update 
sudo apt-get install -y vim

# install haproxy server
sudo add-apt-repository ppa:vbernat/haproxy-1.8
sudo apt-get update
sudo apt-get install -y haproxy
