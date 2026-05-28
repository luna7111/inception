#!/bin/bash

set -e

echo "MariaDB Entrypoint started ദി(˵ •̀ ᴗ - ˵ ) ✧"

# Initialize MySQL data directory if it doesn't exist
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "\"૮₍ ˶•⤙•˶ ₎ა Initializing mysql datadir"
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

# Start the server (no networking for setup)
echo "Starting MariaDB temporarily to configure it (╭ರ_•́)"
mysqld --skip-networking --socket=/run/mysqld/mysqld.sock --user=mysql &
pid="$!"

# Wait for MariaDB to be ready
echo "(ᴗ˳ᴗ)ᶻ𝗓𐰁 Waiting for MariaDB to start"
until mysqladmin --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1; do
    sleep 1
done
echo "MariaDB started"

# Run setup SQL: create database and users
echo "Setting MariaDB up (╭ರ_•́)"
mysql --socket=/run/mysqld/mysqld.sock \
  -u root \
  -p"$(cat /run/secrets/db_root_password)" << EOF

CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '$(cat /run/secrets/db_password)';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# Shut down temporary server
echo "Shutting down teporary MariaDB instance (ᴗ˳ᴗ)ᶻ𝗓𐰁"
mysqladmin --socket=/run/mysqld/mysqld.sock -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

# Wait for shutdown
wait "$pid" || true

# Start MariaDB normally (with networking)
echo "Starting MariaDB with PID 1"
exec mysqld --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock
