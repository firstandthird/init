#!/bin/bash

if [ ! -d /share/phpmyadmin/ ];
  export DEBIAN_FRONTEND=noninteractive
  apt-get install -q -y phpmyadmin
then
  echo "phpmyadmin already installed"
fi
