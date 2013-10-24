#!/bin/sh

if [ ! -f "/usr/bin/git" ]; then
  apt-get update
  apt-get -y install vim git htop curl make
else
  echo "Git, vim, htop, curl already installed"
fi
