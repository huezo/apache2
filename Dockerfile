FROM ubuntu:bionic

#https://hub.docker.com/_/ubuntu/

# File Author / Maintainer
MAINTAINER huezohuezo1990

# Update the repository sources list
RUN apt-get update

# Install and run apache
RUN apt-get install -y apache2 && apt-get clean

# Install nano
RUN apt-get install -y nano && apt-get clean

# Install and run net-tools
RUN apt-get install -y net-tools && apt-get clean


#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]


#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
CMD apachectl -D FOREGROUND

