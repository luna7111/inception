FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y
# Update apt packages
RUN apt-get install mariadb-server -y
# Install mariaDB server
RUN rm -rf /var/lib/apt/lists/*
# Clean APT cache

COPY config/my.cnf /etc/mysql/my.cnf
# Copy pre-made config file to /etc/mysql/my.cnf 
COPY tools/setup.sh /setup.sh
# Copy entrypoint script to root

RUN chmod +x /setup.sh
# Set entrypoint script as executable

ENTRYPOINT ["/setup.sh"]
