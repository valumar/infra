#!/bin/bash

MONGODB_VER='3.2'

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/$MONGODB_VER multiverse" > /etc/apt/sources.list.d/mongodb-org-$MONGODB_VER.list
apt update; sudo apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
systemctl status mongod

