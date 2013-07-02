#!/bin/sh

cd /home/vagrant
if [ ! -d "dotfiles" ]; then
  git clone https://github.com/jgallen23/dotfiles.git
fi
cd /home/vagrant/dotfiles
git submodule update --init
cd ..
chown vagrant:vagrant -R dotfiles
cd /home/vagrant/dotfiles
./symlinks-basic
