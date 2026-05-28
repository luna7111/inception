# User documentation

## Services

This infrastructure has 3 services which run independently:

- **Nginx** is the HTTP server and proxy, which receives the HTTP request and routes them to Wordpress.
- **Wordpress** is a content management system which provides the website.
- **MariaDB** is a SQL database where Wordpress stores it's data. 

## Setup

Clone the repository from Github or the 42 Vogsphere Repository.
```
git clone https://github.com/luna7111/inception
```
Place the secrets folder and .env file.

> [!Warning]
>
> The Github repository already provides secrets folder and .env file with example values.
> DO NOT use this in real infrastructure, always keep your credentials private.

## Website

Only the 443 port (HTTPS) is exposed by docker, so ensure to include ``https://`` in the url, for example `https://localhost` or `https://ldel-val.42.fr`.

> [!Warning]
>
> The SSL certificate provided by the Nginx Docker is self-signed. A real certificate signed by a trusted entity should be used in real production.

## Credentials

Credentials are stored in the secrets folder and .env file, edit them to match your desired credentials.

## Debug

Some usefull commands for debugging:
- docker ps [OPTIONS] lists containers, the -a flag Shows all containers.
- `docker volume COMMAND` lets you manage volumes:
  - `inspect` displays detailed information of the volume.
  - `ls` lists volumes.
  - `rm` removes the volume.
- `docker logs [OPTIONS] CONTAINER` fetches the logs of a container.
