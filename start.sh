#bledda <bledda@student.42nice.fr>
#Script for configuration docker ft_server

docker build -t ft_server_image .
#docker run --env autoindex=off -d -it -p 80:80 -p 443:443 --name ft_server ft_server_image
docker run -d -it -p 80:80 -p 443:443 --name ft_server ft_server_image