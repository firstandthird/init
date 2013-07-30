#!/bin/bash

# if apache2 does no exist
if [ ! -f /etc/apache2/apache2.conf ];
then
  # Install MySQL
  echo 'mysql-server-5.1 mysql-server/root_password password vagrant' | debconf-set-selections
  echo 'mysql-server-5.1 mysql-server/root_password_again password vagrant' | debconf-set-selections
  apt-get -y install mysql-client mysql-server-5.5

  # Install Apache2
  apt-get -y install apache2

  # Install PHP5 support
  apt-get -y install php5 libapache2-mod-php5 php5-mysql php5-curl php5-gd

  # Enable mod_rewrite
  a2enmod rewrite

  # Enable SSL
  #a2enmod ssl

  # Add www-data to vagrant group
  usermod -a -G vagrant www-data

else
  echo "apache, mysql and php already installed"
fi

cp /var/vagrant/init/conf/default /etc/apache2/sites-available/
cp /var/vagrant/init/conf/apache2.conf /etc/apache2/
/etc/init.d/apache2 restart
