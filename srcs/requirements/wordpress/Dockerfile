FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install -y php-fpm php php-mysql mariadb-client

RUN mkdir /tmp/image-build-files

# Download wordpress to /tmp/image-build-files/latest.zip
# Unzip the compressed archive
# Make root the propietary and group of the file

RUN wget https://wordpress.org/latest.zip -P /tmp/image-build-files
RUN unzip /tmp/image-build-files/latest.zip -d /var/www
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp/image-build-files
RUN chmod +x /tmp/image-build-files/wp-cli.phar
RUN mv /tmp/image-build-files/wp-cli-phar /usr/local/bin/wp

RUN rm -r /tmp/image-build-files

EXPOSE 9000
