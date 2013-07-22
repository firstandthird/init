#!/bin/sh

if [ ! -f "/usr/bin/node" ]; then
  apt-get -y install python-software-properties make g++
  add-apt-repository -y ppa:chris-lea/node.js
  apt-get -y update
  apt-get -y install nodejs
else
  echo "node already installed"
fi
