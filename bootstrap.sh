#!/usr/bin/env bash
# Vagrant config for PyroCMS
# Author:  Dan Bough (daniel.bough <at> gmail <dot> com / www.danielbough.com)
# License:  GPLv3
# Copyright 2013

# Choose your repo (only tested on 2.2/master)
REPO=2.2/master

if [ ! -f /var/log/firsttime ];
then
	sudo touch /var/log/firsttime

    # Set credentials for MySQL
	sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password password'
	sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password password'

    # Install packages
	sudo apt-get update
	sudo apt-get -y install mysql-server-5.5 php5-mysql apache2 php5 git

    # Add timezones to database
    mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot -ppassword mysql

    # Download PyroCMS
    sudo git clone https://github.com/pyrocms/pyrocms.git -b $REPO

    # Move Pyro to its new home.
    sudo rm -f /var/www/*
    sudo mv pyrocms/* /var/www/

    # Remove repo folder (we don't need it anymore).
    sudo rm -r -f pyrocms/

    # Allow URL rewrites
    sudo a2enmod rewrite
    sudo sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default

    # php5-mysql comes w/mysql drivers, but we still have to update php.ini to use them.
    sudo sed -i 's/;pdo_odbc.db2_instance_name/;pdo_odbc.db2_instance_name\nextension=pdo_mysql.so/' /etc/php5/apache2/php.ini

    sudo service apache2 restart
fi