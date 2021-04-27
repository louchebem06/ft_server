#bledda <bledda@student.42nice.fr>
#Script for configuration docker ft_server

#Change value for autoindex nginx webserver
sed -i "/autoindex /c\autoindex ${autoindex};" /etc/nginx/conf.d/default.conf

#Restart nginx server
service nginx restart