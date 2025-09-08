#!/bin/bash

######################################################################
# @author      : luna (luna@$HOSTNAME)
# @file        : startup
# @created     : Friday Sep 05, 2025 17:21:18 CEST
#
# @description : startup script for the mariadb image
######################################################################

set -eu
# prevents the script from working if some env variable isn't set or
# some command fails
# see wizardzines.com/comics/bash-errors

chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /run/mysqld

# starts mysql daemon in the backgroud (this is temporary
# just to create the database and stuff)
mysqld &

# Wait for the daemon to be actually started
# (better alternative to just using a long wait)
until mysqladmin ping --silent; do
	echo "Waiting for MariaDB to start...  (˶ᴗ_ᴗ˵) ᶻ 𝗓 𐰁"
	sleep 1
done

# if database does not exist already, do some sql magic and create it
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
	echo "Starting database! ⸜(｡˃ ᵕ ˂ )⸝⋆˙⟡♡ (SQL magic dust)"
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
	mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"
	mysql -e "FLUSH PRIVILEGES;"
else
	echo "Database is already initialised ദി(｡•̀ ,<)~✩‧₊"
fi

# Shut down temporary daemon
mysqladmin -u root -p $MARIADB_ROOT_PASSWORD shutdown

exec mysqld
# Exec, executes a program whicc takes the place of the script
# also its PID (PID 1) which is very important
#
# Any code afterwards won't be executed
