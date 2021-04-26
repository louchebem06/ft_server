FROM debian:buster
ENV autoindex=on
COPY ./srcs/init.sh /
COPY ./srcs/default.conf /
COPY ./srcs/autoindex.sh /
COPY ./srcs/wp-config.php /
COPY ./srcs/phpMyAdmin-5.1.0-all-languages.zip /
COPY ./srcs/wordpress-5.7.1-fr_FR.zip /
RUN /bin/bash ./init.sh
CMD service php7.4-fpm start && ./autoindex.sh && service mysql start && tail -f /dev/null
