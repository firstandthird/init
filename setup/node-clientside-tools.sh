#!/bin/sh

if [ ! -f "/usr/bin/bower" ]; then
  npm install -g grunt-cli bower
  rm -rf $HOME/.npm
  rm -rf $HOME/tmp
else
  echo "Bower and grunt already installed"
fi

