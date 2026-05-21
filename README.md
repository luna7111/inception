*This project has been created as a part of the 42 curriculum by ldel-val*

# Inception

## Description 

This project consisted on the development of a small Docker network with three microservices (Wordpress, Nginx and MariaDB) writing each Dockerfile and the Docker Compose file from scratch.

## Instructions

### Depencencies

To run the network you will need to have Docker and Docker Compose installed, as well as a .env file with all the environment variable values.

## Resources

docs.docker.com
docs.docker.com/compose/
wordpress.org/support
mariadb.com/docs

## Use of AI

No LMMs or Gen-AI were knowinly used in the development of the project or the documentation. 

## Project description

The project consists on setting up a small infrastructure composed of the following services and features:

- A Docker container that contains NGINX with TLS.
- A Docker container that contains WordPress + php-fpm.
- A Docker container that contains MariaDB.
- A volume that contains the WordPress database.
- A second volume that contains the WordPress website files.
- A docker-network that establishes the connection between your containers.

### Virtual Machines vs Docker

A virtual machine is a program that emulates hardware's ability to execute an operative system. This is nice to run a hole operative system isolated from the hosdt but it is also resource heavy. Docker containers share the linux kernel with the host machine and only installs and runs the neccesary resources to run their service. Containers provide portability and isolation while remainin reasonably light compared to virtual machines.

### Secrets vs Environment Variables

Environment variables are typically used to store configuration settings that are not considered highly sensitive and secrets are used to store highly sensitive information.

In this context, secrets are not encrypted, compose file secrets are a flavour of configs, which is just a convenient way of mounting a file (like bind mounts, but with an standard path and file permissions) which lets you protect them as any other sensible file.
Environment variables are used in the containters environment as plain text.

### Docker Network vs Host Network

### Docker Volumes vs Bind Mounts
