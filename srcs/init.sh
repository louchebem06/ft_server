#bledda <bledda@student.42nice.fr>
#Script for configuration docker ft_server

#Update package
apt-get -y update && apt-get -y upgrade

#Add package for debian
apt-get -y install wget lsb-release apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

#Update package
apt-get -y update && apt-get -y upgrade

#Install package
apt-get -y install php7.4 nginx php7.4-fpm mariadb-server unzip php7.4-xml php7.4-mysqli php7.4-mbstring

#Update package
apt-get -y update && apt-get -y upgrade

#Create certificat for using ssl nginx
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/conf.d/ft_server.key -out /etc/nginx/conf.d/ft_server.crt -subj '/C=FR/ST=PACA/L=Nice/O=42 Nice/CN=localhost'

#Start service mysql
service mysql start

#Create user and database
echo "CREATE USER 'bledda'@'localhost' IDENTIFIED BY 'bledda';" | mysql
echo "GRANT ALL PRIVILEGES ON * . * TO 'bledda'@'localhost';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "CREATE DATABASE wordpress;" | mysql
echo "CREATE DATABASE phpmyadmin;" | mysql

#Import database phpmyadmin
mysql -u root phpmyadmin --force < phpmyadmin.sql

#Extraction phpmyadmin and wordpress
unzip phpMyAdmin-5.1.0-all-languages.zip
unzip wordpress-5.7.1-fr_FR.zip
unzip -o wordpress-custom-setup.zip

#Move folder website to root webserver
mv wordpress /var/www/wordpress
mv phpMyAdmin-5.1.0-all-languages /var/www/phpmyadmin

#Move configuration nginx, wordpress and phpmyadmin
mv default.conf /etc/nginx/conf.d/
mv custom_404.html /etc/nginx/conf.d/
mv custom_403.html /etc/nginx/conf.d/
mv wp-config.php /var/www/wordpress/
mv config.inc.php /var/www/phpmyadmin

#Fix bug tmp phpmyadmin
mkdir /var/www/phpmyadmin/tmp
chmod 777 /var/www/phpmyadmin/tmp

#Delete srcs files
rm -rf /var/www/html phpmyadmin.sql phpMyAdmin-5.1.0-all-languages.zip wordpress-5.7.1-fr_FR.zip /etc/nginx/sites-enabled/default wordpress-custom-setup.zip init.sh