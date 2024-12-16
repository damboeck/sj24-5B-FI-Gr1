FROM phpmyadmin:latest

# HTTPS
RUN a2enmod ssl && \
    a2ensite default-ssl && \
    openssl req -subj '/CN=localhost/O=HTL St.Poelten/C=US' -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem

EXPOSE 80 443
