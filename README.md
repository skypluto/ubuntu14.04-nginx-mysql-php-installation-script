# ubuntu14.04-nginx-mysql-php-installation-script
Scripts to automate the installation of Nginx, MySQL, PHP to Ubuntu-14.04

Need to run with sudo user.

__Simple steps:__

1. sudo ./ubuntu.install.sh 1-preinstall  
2. sudo ./ubuntu.install.sh 2-mysql  
3. sudo ./ubuntu.install.sh 3-nginx  

__Installation Included in the Script:__

1. PHP
2. MySQL
3. Nginx (with sample site file)
4. PHPMyAdmin
5. Exim4

__Special Notes:__

1. If you are running VirtualBox and Ubuntu as guest, the project files (css, js, etc) is in the host (probably Windows).  Changes on those files may not serving to the web may not serving correctly.  Fixes:
	* Open */etc/nginx/nginx.conf*
	* Change *sendfile=on* to *sendfile=off*
2. If you want to use the MySQL in the guest.  Make sure:
	* The user can connect from any host (%) instead of *localhost* only
	* The MySQL is binded to the private IP *10.x.x.x* instead of *127.0.0.1*.  Check the setting in */etc/mysql/mysql.conf.d/mysqld.cnf*.