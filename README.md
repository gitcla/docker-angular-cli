# Docker Angular CLI

A development environment for Angular with NodeJS and Angular CLI in a containerized platform.

This project uses the following software:

- Node official image from Docker Hub: https://hub.docker.com/_/node
- Angular CLI deployed on the node image

## Initialize the base image

To initialize the base image just use the Dockerfile provided on the base-image folder.
You can build it with the build.sh script provided that executes the following command:

```
docker build -t node-ng:7.3.1-cli .
```

The image can be easily shared with your team and the continuos integration system with a Docker Registry.

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

## Access data on your Virtual Machine

If docker is installed on a virtual machine the folder where the code reside can be shared on the host with Samba.

This is a better option than using a Shared Folder configured on VirtualBox because the file system where the project resides is Linux native.
Node uses symbolic links per default and if your file system doesn't support them you could run in trouble.
