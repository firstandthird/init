#!/bin/bash

if [ ! -f "/usr/local/bin/meteor" ]; then
  curl https://install.meteor.com | /bin/sh
  npm install -g meteorite
else
  echo "meteor already installed"
fi
