# Docker Angular CLI

A development environment for Angular with NodeJS and Angular CLI in a containerized platform.

This lab uses the following container:

- Node official image https://hub.docker.com/_/node
- Angular CLI deployed on the node image

## Initialize the base image

To initialize the base image just use the Dockerfile provided on the base-image folder.
You can build it with the build.sh script provided that executes the following command:

```
docker build -t node-ng:7.3.1-cli .
```

## Initialize a new Angular Project

Now you can use the previous image to initialize a new Angular project.

The ng-init.sh executes the following commands:

```
#!/bin/bash

PROJECT_NAME=hello-angular

docker run -v $PWD:/app/ node-ng:7.3.1-cli /bin/bash -c "cd /app && ng new $PROJECT_NAME --style=scss"
```

At the end you will have a new folder with a project initialized.

## Run the project in development mode

You can run the development server with:

```
#!/bin/bash

PROJECT_NAME=hello-angular

docker run -p 4200:4200 -v $PWD/$PROJECT_NAME:/app/ node-ng:7.3.1-cli /bin/bash -c "cd /app && ng serve --host 0.0.0.0"
```

## Build the production code

You can use the container to build the production code with:

```
#!/bin/bash

PROJECT_NAME=hello-angular

docker run -v $PWD/$PROJECT_NAME:/app/ node-ng:7.3.1-cli /bin/bash -c "cd /app && ng build --prod"
```

That's it!  :-)
