#!/usr/bin/env bash

docker build -t tmp . && docker run -ti tmp ls

container_id =  $(docker container ls -a | grep -i tmp | awk '{print $1}' | head -n1)
docker export $container_id > debian_export.tar
docker rm $container_id