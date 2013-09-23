#!/bin/bash

if [ ! -f "/usr/local/bin/fa" ]; then
  (mkdir /tmp/fa && cd /tmp/fa && curl -L# https://github.com/firstandthird/fa/archive/master.tar.gz | tar zx --strip 1 && make install)
else
  echo "fa already installed"
fi
