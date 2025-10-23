#!/bin/bash
set -e

CONTAINER_NAME="simple-python-flask-app"

# Stop and remove existing container if it exists
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping existing container..."
    docker stop $CONTAINER_NAME
fi

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Removing existing container..."
    docker rm $CONTAINER_NAME
fi

# Pull the latest Docker image
docker pull danduniharika30/simple-python-flask-app

# Run the Docker container
docker run -d --name $CONTAINER_NAME -p 5000:5000 danduniharika30/simple-python-flask-app
