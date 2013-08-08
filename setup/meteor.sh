#!/bin/bash

if [ ! -f "/usr/local/bin/meteor" ]; then
  curl https://install.meteor.com | /bin/sh
  npm install -g meteorite
  iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8888
else
  echo "meteor already installed"
fi
