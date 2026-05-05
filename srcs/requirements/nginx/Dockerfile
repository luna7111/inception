FROM debian:bookworm

# Evita diálogos interactivos durante la instalación
# ENV DEBIAN_FRONTEND=noninteractive

# Instalación de dependencias
RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# En Debian, www-data suele ser el UID/GID 33 por defecto. 
# Solo mantenemos esto si necesitas asegurar compatibilidad con volúmenes externos.
RUN usermod -u 33 www-data && groupmod -g 33 www-data

# Crear directorio para certificados y ajustar permisos
RUN mkdir -p /etc/nginx/ssl && \
    chown -R www-data:www-data /etc/nginx/ssl

# Copiar archivos de configuración
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/generate_ssl.sh /usr/local/bin/

# Asegurar permisos de ejecución
RUN chmod +x /usr/local/bin/generate_ssl.sh

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/generate_ssl.sh"]