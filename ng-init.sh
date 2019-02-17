#!/bin/bash

PROJECT_NAME=hello-angular

docker run -v $PWD:/app/ node-ng:7.3.1-cli /bin/bash -c "cd /app && ng new $PROJECT_NAME --style=scss"
