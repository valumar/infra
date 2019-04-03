#!/bin/bash

RUBY_VERSION='2.4.1'

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm requirements
rvm install $RUBY_VERSION
rvm use $RUBY_VERSION --default
gem install bundler -V --no-ri --no-rdoc
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

