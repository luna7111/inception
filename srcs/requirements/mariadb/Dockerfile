FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY config/my.cnf /etc/mysql/my.cnf
COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

ENTRYPOINT ["setup.sh"]
