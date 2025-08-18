# notes

- debian version 12!!!


## nginx

the `-y` means "asume yes" to apt, so it can be somewhat automated

```
apt-get update -y
apt-get upgrade -y
apt-get install nginx -y
```

## wordpress + php

php-fpm en una variante de php que corre de fondo como daemon escuchando solicitudes cgi

cgi es el estandar para que un cliente web (navegador) solicite información a un programa en el servidor web, entiendo que en este caso es para que las solicitudes que reciba nginx vayan a wordpress

```
apt-get update -y
apt-get upgrade -y
apt-get install php-fpm
apt-get install php-mysql

wget --directory-prefix=/var/www/html https://wordpress.org/latest.zip
unzip /var/www/html/latest.zip
rm /var/www/html/latest.zip
mv /var/www/html/wordpress/* /var/www/html/

# quizá ya que vamos a mover cosas, podría no descargarlo y demás directamente
# en ese directorio

```
