#!/bin/sh


if [ ! -f "/usr/bin/bower" ]; then
  npm install -g grunt-cli bower
  rm -rf /home/vagrant/.npm
  rm -rf /home/vagrant/tmp
else
  echo "Bower and grunt already installed"
fi
