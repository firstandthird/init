#!/bin/bash

if [ ! -f "/usr/bin/s3cmd" ]; then
  wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
  wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
  apt-get update 
  apt-get -y install s3cmd
else
  echo "s3cmd already installed"
fi
