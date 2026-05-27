# Developer documentation

## Requirements and dependencies

You will need Docker and Docker Compose (Version 2 or higher).
To build and launch the services automatically you will need GNU Make.

## Environment setup

A .env file with the custom environment variables sould be located at `srcs/.env` with the following variables: 
 
- DOMAIN_NAME  
- MYSQL_DATABASE  
- MYSQL_USER  
- MYSQL_PASSWORD  
- WordPress admin/user credentials

Database passwords are stored in secrets files `secrets/db_password.txt` and `secrets/db_root_password.txt`

The repository contains a default .env and secret files with preset values to be used as reference, DO NOT USE THE DEFAULT VALUES.

## Creating the images and containers

The project includes a Makefile with rules to automate image and container management:

- `make up` builds and starts the services
- `make build` builds the services
- `make down` stops the containers
- `make re` rebuilds the containers
- `make fclean` removes the containers and images

## Managing images, containers and volumes

Here are some useful commands to manage docker images, containers and volumes:

- `docker compose [OPTIONS] COMMAND` defines an runs multi-container applications, the `-f filename` flag sets the compose configuration file:
  - `docker compose build [OPTIONS] [SERVICE...]` builds the services.
  - `docker compose build [OPTIONS] [SERVICE...]` creates and starts services.
  - `docker compose restart [OPTIONS] [SERVICE...]` restarts a service.
  - `docker compose down [OPTIONS] [SERVICES]` stops and removes containers and/or networks.
- `docker ps [OPTIONS]` lists containers, the `-a` flag Shows all containers.
- `docker rm [OPTIONS] CONTAINER [CONTAINER...]` removes containers.
- `docker rmi [OPTIONS] IMAGE [IMAGE...]` removes images.
- `docker exec [OPTIONS] CONTAINER COMMAND [ARG...]` executes a command in a running containter, the `-it` flags create a pseudo-tty (`-t`) and leave STDIN open (`-i`) which lets you interact with the container in real time.
- `docker volume COMMAND` lets you manage volumes:
  - `inspect` displays detailed information of the volume.
  - `ls` lists volumes.
  - `rm` removes the volume.
- `docker logs [OPTIONS] CONTAINER` fetches the logs of a container.

## Data stores information

Persistent data is stored in named volumes which are mounted to files in `/home/user/data`, there is a `mariadb` and a `wordpress` file.
