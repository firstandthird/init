#!/bin/sh


cd /home/vagrant

if [ -d "dotfiles" ]; then
  #cleanup old code
  rm -rf dotfiles
  rm .bash_aliases
  rm .bash_profile
  rm bin
  rm .inputrc
  rm .jshintrc

  rm ~/.bash_aliases
  rm ~/.bash_profile
  rm ~/bin
  rm ~/.inputrc
  rm ~/.jshintrc
  rm ~/.vim
  rm ~/.vimrc
fi


cp /var/www/vagrant/init/conf/bash_profile .bash_profile
chown vagrant:vagrant .bash_profile
cp /var/www/vagrant/init/conf/vimrc .vimrc
chown vagrant:vagrant .vimrc
cp /var/www/vagrant/init/conf/inputrc .inputrc
chown vagrant:vagrant .inputrc

if [ -f "/var/www/vagrant/env" ]; then
  cp /var/www/vagrant/env .bash_env
  chown vagrant:vagrant .bash_env
fi

