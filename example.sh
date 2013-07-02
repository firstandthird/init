#!/bin/sh

DIR=$(dirname "$0")

#just include the scripts that you want load
sh $DIR/scripts/base.sh
sh $DIR/scripts/node.sh
sh $DIR/scripts/node-clientside-tools.sh
sh $DIR/scripts/dotfiles.sh
