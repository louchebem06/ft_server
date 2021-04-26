sed -i "/autoindex/c\autoindex ${autoindex};" /etc/nginx/conf.d/default.conf
service nginx restart