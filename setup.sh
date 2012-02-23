#!/bin/bash

MONGO=1
NODE=1
NPM=1
FOREVER=0
BOUNCY=0
HTTPPROXY=1
REDIS=1
VIM=1
SCREEN=0
TMUX=1
GIT=1
DOTFILES=1

# Add MongoDB Package
if [ $MONGO == 1 ]; then
	echo 'Add MongoDB Package'
	echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
	echo 'MongoDB Package completed'
fi

# Update System
echo 'System Update'
apt-get -y update
echo 'Update completed'

# Install help app
echo 'Installing Core'
apt-get -y install libssl-dev pkg-config build-essential curl gcc g++
echo 'Core install completed.'

# Download & Unpack Node.js - v. 0.4.12
if [ $NODE == 1 ]; then
	echo 'Download Node.js - v. 0.4.12'
	mkdir /tmp/node-install
	cd /tmp/node-install
	wget http://nodejs.org/dist/node-v0.4.12.tar.gz
	tar -zxf node-v0.4.12.tar.gz
	echo 'Node.js download & unpack completed'

	# Install Node.js
	echo 'Install Node.js'
	cd node-v0.4.12
	./configure && make && make install
	echo 'Node.js install completed'
fi
# Install Node Package Manager
if [ $NPM == 1 ]; then
	echo 'Install Node Package Manager'
	curl http://npmjs.org/install.sh | sh
	echo 'NPM install completed'
fi

# Install Forever
if [ $FOREVER == 1 ]; then
	echo 'Install Forever'
	npm install forever -g
	echo 'Forever install completed'
fi

#Bouncy
if [ $BOUNCY == 1 ]; then
	echo 'Install Bouncy'
	npm install bouncy -g
	echo 'Bouncy install complete.'
fi

#HTTP Proxy
if [ $HTTPPROXY == 1 ]; then
	echo 'Install HTTP Proxy'
	npm install http-proxy -g
	echo 'HTTPProxy install complete.'
fi

# Install MongoDB
if [ $MONGO == 1 ]; then
	echo 'Install MongoDB'
	apt-get -y install mongodb-10gen
	echo 'MongoDB install completed.'
fi

# Install Redis
if [ $REDIS == 1 ]; then
	echo 'Install Redis'
	cd /tmp
	mkdir redis && cd redis
	wget http://redis.googlecode.com/files/redis-2.4.5.tar.gz
	tar -zxf redis-2.4.5.tar.gz
	cd redis-2.4.5
	make && make install
	wget https://github.com/ijonas/dotfiles/raw/master/etc/init.d/redis-server
	rm redis.conf
	wget https://github.com/ijonas/dotfiles/raw/master/etc/redis.conf
	mv redis-server /etc/init.d/redis-server
	chmod +x /etc/init.d/redis-server
	mv redis.conf /etc/redis.conf
	useradd redis
	mkdir -p /var/lib/redis
	mkdir -p /var/log/redis
	chown redis.redis /var/lib/redis
	chown redis.redis /var/log/redis
	update-rc.d redis-server defaults
	echo 'Redis install completed. Run "sudo /etc/init.d/redis-server start"'
fi

# Install vim
if [ $VIM == 1 ]; then
	echo 'Install Vim'
	apt-get -y install vim
	echo 'Vim install complete.'
fi

#Install Screen
if [ $SCREEN == 1 ]; then
	echo 'Install Screen'
	apt-get -y install screen
	echo 'Screen install complete.'
fi

#Install Tmux
if [ $TMUX == 1]; then
	echo 'Install Tmux'
	apt-get -y install tmux
	echo 'TMux install complete.'
fi

#Install Git
if [ $GIT == 1 ]; then
	echo 'Install Git'
	apt-get -y install git
	echo 'Git install complete.'
fi

#Dotfiles
if [ $DOTFILES == 1 ]; then
	echo 'Setting up Dotfiles'
	cd ~
	git clone git://github.com/jgallen23/dotfiles.git 
	cd dotfiles
	git submodule update --init
	./symlinks
	echo 'Dotfiles setup complete.'
fi
echo 'All done.'
