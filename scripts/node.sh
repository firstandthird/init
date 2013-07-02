#!/bin/sh

apt-get -y install python-software-properties make g++
add-apt-repository -y ppa:chris-lea/node.js
apt-get -y update
apt-get -y install nodejs
