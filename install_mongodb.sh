#!/bin/bash

MONGODB_VER="3.2"

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/$MONGODB_VER multiverse" > /etc/apt/sources.list.d/mongodb-org-$MONGODB_VER.list'
sudo apt update; sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod

