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

## Data stores information
