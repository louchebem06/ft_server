#bledda <bledda@student.42nice.fr>
#Dockerfile for configuration docker ft_server

#Select OS for Docker
FROM debian:buster

#Declaration variable environement
ENV autoindex=on

#Import srcs file for configuration docker
COPY ./srcs/init.sh /
COPY ./srcs/default.conf /
COPY ./srcs/autoindex.sh /
COPY ./srcs/wp-config.php /
COPY ./srcs/config.inc.php /
COPY ./srcs/phpmyadmin.sql /
COPY ./srcs/custom_404.html /
COPY ./srcs/custom_403.html /
COPY ./srcs/autoindex.xslt /
COPY ./srcs/wordpress-custom-setup.zip /
COPY ./srcs/phpMyAdmin-5.1.0-all-languages.zip /
COPY ./srcs/wordpress-5.7.1-fr_FR.zip /

#Run script for configuration docker
RUN /bin/bash ./init.sh

#Command for start server
CMD service php7.4-fpm start && ./autoindex.sh && service mysql start && tail -f /dev/null


#
#	PHPMYADMIN
#
#	USERNAME: bledda
#	PASSWORD: bledda
#
#	DEFAULT THEME: metro
#
