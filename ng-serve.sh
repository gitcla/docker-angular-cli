#!/bin/bash

PROJECT_NAME=hello-angular

docker run -p 4200:4200                \
           -v $PWD/$PROJECT_NAME:/app/ \
           --user $(id -u):$(id -g)    \
           node-ng:7.3.1-cli           \
           /bin/bash -c "cd /app && ng serve --host 0.0.0.0"
