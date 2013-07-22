#!/bin/sh

DIR=$(dirname "$0")

#comment out any scripts you don't need
sh $DIR/setup/base.sh
sh $DIR/setup/lamp.sh
sh $DIR/setup/node.sh
sh $DIR/setup/node-clientside-tools.sh
sh $DIR/setup/nodemon.sh
sh $DIR/setup/mon.sh
sh $DIR/setup/s3cmd.sh
sh $DIR/setup/dotfiles.sh
