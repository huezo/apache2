#FROM ubuntu:focal
FROM ubuntu:focal

#https://hub.docker.com/_/ubuntu/

# File Author / Maintainer
MAINTAINER huezohuezo1990

# Update the repository sources list
RUN apt-get update

#https://www.vmware.com/support/developer/vc-sdk/visdk400pubs/ReferenceGuide/timezone.html

# Set the timezone.
RUN apt-get install -y tzdata 
RUN echo "America/El_Salvador " > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata



# Install and run apache
RUN apt-get install -y apache2 && apt-get clean

# Install nano
RUN apt-get install -y nano && apt-get clean

# Install  net-tools y curl 
RUN apt-get install -y net-tools curl && apt-get clean

# ping

RUN apt install -y iputils-ping && apt-get clean


# php

RUN apt install -y php php-cgi libapache2-mod-php php-common php-pear php-mbstring && apt-get clean


ADD index.html /var/www/html

ADD php.php /var/www/html 


# Reenviar registros de solicitudes y errores 
# al recolector de registros de Docker

RUN  ln -sf /dev/stdout /var/log/apache2/access.log 
RUN   ln -sf /dev/stderr /var/log/apache2/error.log 






#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]


#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
EXPOSE 443


CMD apachectl -D FOREGROUND
