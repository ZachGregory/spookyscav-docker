#!/bin/bash
export NAME=mariadb
docker build -t spookyscav/$NAME . --no-cache

docker stop $NAME
docker rm $NAME

docker run -it -d --name $NAME --net host -v $(pwd)/backups:/var/backups --mount source=db,target=/var/lib/mysql/ -e MARIADB_ROOT_PASSWORD="password" --restart unless-stopped spookyscav/$NAME --wait_timeout=31536000 --max_connections=100
