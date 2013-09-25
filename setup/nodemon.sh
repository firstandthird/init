#!/bin/sh

if [ ! -f "/usr/bin/nodemon" ]; then
  npm install -g nodemon
  rm -rf $HOME/.npm
  rm -rf $HOME/tmp
else
  echo "nodemon already installed"
fi
