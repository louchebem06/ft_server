apt-get -y update
apt-get -y upgrade
apt-get -y install wget vim lsb-release apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
apt-get -y update
apt-get -y upgrade
apt-get -y install php7.4 nginx php7.4-fpm mariadb-server unzip php7.4-xml php7.4-mysqli
rm /etc/nginx/sites-enabled/default
mv default.conf /etc/nginx/conf.d/
apt-get -y update && apt-get -y upgrade
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/conf.d/ft_server.key -out /etc/nginx/conf.d/ft_server.crt -subj '/C=FR/ST=PACA/L=Nice/O=42 Nice/CN=localhost'
service nginx restart
service mysql start
echo "CREATE USER 'bledda'@'localhost' IDENTIFIED BY 'bledda';" | mysql
echo "GRANT ALL PRIVILEGES ON * . * TO 'bledda'@'localhost';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "CREATE DATABASE wordpress;" | mysql
unzip phpMyAdmin-5.1.0-all-languages.zip
unzip wordpress-5.7.1-fr_FR.zip
rm -rf /var/www/html
mv phpMyAdmin-5.1.0-all-languages /var/www/phpmyadmin
mv wp-config.php wordpress/
mv wordpress /var/www/wordpress
rm -rf phpMyAdmin-5.1.0-all-languages.zip
rm -rf wordpress-5.7.1-fr_FR.zip
service php7.4-fpm start
rm -rf init.sh