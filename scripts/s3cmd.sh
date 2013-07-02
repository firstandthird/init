#!/bin/bash

wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
apt-get update 
apt-get -y install s3cmd
