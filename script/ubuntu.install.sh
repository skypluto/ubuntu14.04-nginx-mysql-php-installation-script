#!/bin/bash

POSSIBLETARGET=("1-preinstall" "2-mysql" "3-nginx" )
dumphelp(){
        echo "sudo $0 <target>"
        echo "possible target: `printf '\n\t%s' "${POSSIBLETARGET[@]}"`"
        exit 1
}

if [ $# -ne 1 ]; then
        dumphelp
fi

if [ $1 = "1-preinstall" ]; then
	apt-get -y install vim-nox
	apt-get update
	apt-get upgrade
	reboot
elif [ $1 = "2-mysql" ]; then
	apt-get -y install mysql-client mysql-server
	sed -i.bak -f mysql.sed /etc/mysql/my.cnf
	/etc/init.d/mysql restart
elif [ $1 = "3-nginx" ]; then
	apt-get -y install nginx
	apt-get -y install php5-fpm

	apt-get -y install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl

	apt-get -y install php-apc

	apt-get -y install fcgiwrap
	apt-get -y install phpmyadmin
	sed -i.bak -f nginx.sed /etc/php5/fpm/pool.d/www.conf
	/etc/init.d/nginx start
	/etc/init.d/php5-fpm restart
	cp nginx/* /etc/nginx/sites-available
	apt-get -y install git
	php5enmod mcrypt
	apt-get -y install exim4-daemon-light mutt
	dpkg-reconfigure exim4-config
	reboot
fi

