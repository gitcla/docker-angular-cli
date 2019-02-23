#!/bin/bash

PROJECT_NAME=hello-angular

docker run                       \
     -v $PWD/$PROJECT_NAME:/app/ \
     --user $(id -u):$(id -g)    \
     node-ng:7.3.1-cli           \
     /bin/bash -c "cd /app && ng build --prod"
