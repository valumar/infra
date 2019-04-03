#!/bin/bash

RUBY_VERSION="2.4.1"

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install $RUBY_VERSION
rvm use $RUBY_VERSION --default
gem install bundler -V --no-ri --no-rdoc
ruby -v
bundle -v

