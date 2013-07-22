#!/bin/sh

if [ ! -f "/usr/local/bin/mon" ]; then
  (mkdir /tmp/mon && cd /tmp/mon && curl -L# https://github.com/jgallen23/mon/archive/master.tar.gz | tar zx --strip 1 && make install && rm -rf /tmp/mon)
else
  echo "mon already installed"
fi
