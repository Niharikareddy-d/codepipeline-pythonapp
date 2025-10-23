#!/bin/bash
set -e

CONTAINER_NAME="danduniharika_simple_python"
IMAGE_NAME="danduniharika30/simple-python-flask-app"

# Stop and remove existing container if it exists
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME
fi

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    docker rm $CONTAINER_NAME
fi

# Pull latest image
docker pull $IMAGE_NAME

# Run container
docker run -d --name $CONTAINER_NAME -p 5000:5000 $IMAGE_NAME

echo "Container $CONTAINER_NAME started with image $IMAGE_NAME"
