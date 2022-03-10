#bin/bash

docker kill $(docker ps -q)
docker container prune -f

docker run --name disbalancer-1 -d launcher-disbalancer:0.0.6
docker run --name disbalancer-2 -d launcher-disbalancer:0.0.6
docker run --name disbalancer-3 -d launcher-disbalancer:0.0.6
docker run --name disbalancer-4 -d launcher-disbalancer:0.0.6