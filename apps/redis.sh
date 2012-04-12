#!/bin/sh

VERSION=2.4.10

# Install Redis
echo 'Install Redis'
cd /tmp
mkdir redis && cd redis
wget http://redis.googlecode.com/files/redis-$VERSION.tar.gz
tar -zxf redis-$VERSION.tar.gz
cd redis-$VERSION
make && make install
wget https://github.com/ijonas/dotfiles/raw/master/etc/init.d/redis-server
#wget https://github.com/ijonas/dotfiles/raw/master/etc/redis.conf
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
