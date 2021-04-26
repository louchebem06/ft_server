docker build -t ft_server_image .
docker run --env autoindex=off -d -it -p 80:80 -p 443:443 --name ft_server ft_server_image