#!/bin/bash

# pull in bash, vim and other pimpup for the current user
# and for root

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y git
git clone https://github.com/dyle/docker.git

(
    cd docker/install
    sed -i "s/someuser/$(whoami)/" install.sh
    sudo /bin/bash -C install.sh
)
rm -rf docker/install
