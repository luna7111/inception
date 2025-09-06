# Apuntes sobre las partes importantes del proyecto inception

uhhm yeah

## Contenedor nginx

Es el servidor web, está chuli

### TLS

Transport Layer Security es un protocolo criptográfico para hacer las conexiones a través de la red sean seguras
cifrando los datos que viajan entre dos puntos.

TLS es el sucesor de SSL (Secure Sockets Layer) que ya está obsoleto, pero a veces se le llama SSL indistintivamente.

### HTTPS

HTTPS es HTTP + TLS, el protocolo HTTP sigue haciendo las solicitudes igual,
solo que con una conexión cifrada con TLS

![](https://wizardzines.com/images/uploads/https.png){width=500}

### Certificados TLS

Los certificados TLS son un archivo que contiene la prueba de que un servidor
no está siendo suplantado, además de la información necesaria para que el servidor
y el cliente puedan negociar una clave privada.

> La fase de negociación no es relevante para el proyecto pero es súper interesante
> y es algo que me gustaría revisar más adelante:
>
> [Diffie-Hellman key exchange](en.wikipedia.org/wiki/Diffie–Hellman_key_exchange)
>
> [Elliptic-curve Diffie-Hellman](https://en.wikipedia.org/wiki/Elliptic-curve_Diffie%E2%80%93Hellman)

![](https://wizardzines.com/images/uploads/certificates.png){width=500}

### OpenSSL

OpenSSl es una herramienta para hacer cosas relacionadas con SSL y TLS, por ejemplo, para crear y firmar certificados

![](https://wizardzines.com/images/uploads/openssl.png)

## Contenedor wordpress

Wordpress es un sistema de gestión de contenido web escrito en PHP, genera el contenido de forma dinámica.

Donde una web estática recibe una petición del cliente solicitando un arhivo que ya existe, una web dinámica tiene que generarlo antes de enviárselo al cliente.

### PHP

PHP es un lenguaje de programación que se usa del lado del servidor, es un lenguaje interpretado.
Por eso es necesario tenerlo instalado para que wordpress funcione correctamente.
