#
# Name: Luna del Valle
# File: Makefile
# Created on: Sunday Aug 17, 2025 17:27:13 CEST
#

########################

all: $(up)

up: build
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

build:
	docker compose -f srcs/docker-compose.yml build


clean:
	docker system prune -a

.PHONY: all build up down clean
