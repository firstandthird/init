#!/bin/bash

if [ ! -f "/usr/bin/mongod" ]; then
  apt-get -y install mongodb-server
else
  echo "mongodb already installed"
fi
