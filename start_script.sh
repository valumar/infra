#!/bin/bash

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundle -v


MONGODB_VER='3.2'

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/$MONGODB_VER multiverse" > /etc/apt/sources.list.d/mongodb-org-$MONGODB_VER.list
sudo apt-get update; sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod


git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d

