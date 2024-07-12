#!/bin/bash
# Define variables
CONTAINER_NAME="forum"
echo "resetting reddit"

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker run --rm -p 55999:80 ubuntu bash
sleep 1

docker run --name $CONTAINER_NAME -p 55999:80 -d postmill-populated-exposed-withimg_fixed
# wait ~15 secs for all services to start
sleep 15

echo "restarted reddit"
