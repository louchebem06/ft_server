[![jaeskim's 42Project Score](https://badge42.herokuapp.com/api/project/bledda/ft_server)](https://github.com/JaeSeoKim/badge42)

Dockerfile minimum
```Dockerfile
FROM debian:buster
CMD tail -f /dev/null
```

Pour crée image
```shell
docker build -t ft_server_image .
```

Pour lancer le contenaire
```shell
docker run -p 80:80 -p 443:443 --name ft_server ft_server_image
```

Pour rentrer en CLI dans le contenaire
```shell
docker exec -it ft_server /bin/bash
```

Pour voir les contenaire
```shell
docker ps
```

Pour voir les image
```shell
docker images
```

Pour stop un contenaire
```shell
docker stop ft_server
```

pour del un contenaire
```shell
docker rm ft_server
```

Pour del une images
```shell
docker rmi ft_server_image
```

Purge Docker
```shell
docker system prune -a
```
