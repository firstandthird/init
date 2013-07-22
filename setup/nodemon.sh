#!/bin/sh

if [ ! -f "/usr/bin/nodemon" ]; then
  npm install -g nodemon
  rm -rf /home/vagrant/.npm
  rm -rf /home/vagrant/tmp
else
  echo "nodemon already installed"
fi
