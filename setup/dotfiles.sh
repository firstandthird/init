#!/bin/sh

DIR=$(dirname "$0")

user_home=$HOME

if [ -n "$SUDO_USER" ]; then
  user_home="/home/$SUDO_USER"
fi

echo $user_home


cp $DIR/../conf/bash_profile $user_home/.bash_profile
cp $DIR/../conf/vimrc $user_home/.vimrc
if [ -n "$SUDO_USER" ]; then
  chown $SUDO_USER:$SUDO_USER $user_home/.bash_profile
  chown $SUDO_USER:$SUDO_USER $user_home/.vimrc
fi

#TODO: use hostname
if [ -f "/var/vagrant/env" ]; then
  cp /var/vagrant/env .bash_env
  chown vagrant:vagrant .bash_env
fi

