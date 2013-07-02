#!/bin/sh

cd ~
if [ ! -d "dotfiles" ]; then
  git clone https://github.com/jgallen23/dotfiles.git 
fi
cd dotfiles
git submodule update --init
./symlinks-basic
