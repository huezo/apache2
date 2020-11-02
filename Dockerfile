FROM ubuntu:bionic

#https://hub.docker.com/_/ubuntu/

#ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=America/El_Salvador


# File Author / Maintainer
MAINTAINER huezohuezo1990

# Set the timezone.
ENV TZ=America/El_Salvador
RUN apt-get update 
RUN apt-get install -y tzdata 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime 
RUN echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata



# Update the repository sources list
RUN apt-get update

# Install and run apache
RUN apt-get install -y apache2 && apt-get clean

# Install nano
RUN apt-get install -y nano && apt-get clean

# Install  net-tools + curl
RUN apt-get install -y net-tools curl && apt-get clean

# ping

RUN apt install -y iputils-ping && apt-get clean


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
