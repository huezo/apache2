#FROM ubuntu:focal
FROM ubuntu:focal

#https://hub.docker.com/_/ubuntu/ 

#ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=America/El_Salvador


MAINTAINER huezohuezo1990 <huezohuezo1990>
ENV LANG C.UTF-8

# Set the timezone.
ENV TZ=America/El_Salvador
RUN apt-get update 
RUN apt-get install -y tzdata 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime 
RUN echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata


# Update the repository sources list
RUN apt-get update

# Set the timezone.
RUN apt-get install -y tzdata 
RUN echo "America/El_Salvador " > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata


# Install and run apache
RUN apt-get install -y apache2 && apt-get clean

# php

RUN apt install -y php php-cgi libapache2-mod-php php-common php-pear php-mbstring && apt-get clean



# Install nano
RUN apt-get install -y nano && apt-get clean

# Install  net-tools + curl
RUN apt-get install -y net-tools curl && apt-get clean

# ping

RUN apt install -y iputils-ping && apt-get clean

RUN apt update && apt install openssl -y 

# RUN rm -rf /var/www/html/* && rm -rf /etc/apache2/sites-enabled/*
RUN    mkdir -p /etc/apache2/external

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN sed -i 's/^ServerSignature/#ServerSignature/g' /etc/apache2/conf-enabled/security.conf; \
    sed -i 's/^ServerTokens/#ServerTokens/g' /etc/apache2/conf-enabled/security.conf; \
    echo "ServerSignature Off" >> /etc/apache2/conf-enabled/security.conf; \
    echo "ServerTokens Prod" >> /etc/apache2/conf-enabled/security.conf; \
    a2enmod ssl; \
    a2enmod headers; \
    echo "SSLProtocol ALL -SSLv2 -SSLv3" >> /etc/apache2/apache2.conf

ADD 000-default.conf /etc/apache2/sites-enabled/000-default.conf
ADD 001-default-ssl.conf /etc/apache2/sites-enabled/001-default-ssl.conf

EXPOSE 80
EXPOSE 443

ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod a+x /opt/entrypoint.sh


# Reenviar registros de solicitudes y errores 
# al recolector de registros de Docker

RUN  ln -sf /dev/stdout /var/log/apache2/access.log 
RUN  ln -sf /dev/stderr /var/log/apache2/error.log 



ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
