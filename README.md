# docker-images
Docker Image Apache2 Ubuntu


# pull apache2:latest

```docker pull huezohuezo1990/apache2:latest```

# run apache2:latest

```docker run -d  --restart=always  -p 80:80 --name apache2-ubuntu huezohuezo1990/apache2:latest```

or

run port 8080


```docker run -d --restart=always -p 8080:80 --name apache2-ubuntu huezohuezo1990/apache2:latest```



# swarm service apache2:latest

```docker service create --name apache2-service --restart-condition on-failure -p 80:80 huezohuezo1990/apache2:latest```


or 

swarm service port 8080 apache2:latest

```docker service create --name apache2-service --restart-condition on-failure -p 8080:80 huezohuezo1990/apache2:latest```




# pull apache2:bionic

```docker pull huezohuezo1990/apache2:bionic```

# run apache2:bionic

```docker run -d  --restart=always  -p 80:80 --name apache2-ubuntu huezohuezo1990/apache2:bionic```

or

run port 8080


```docker run -d --restart=always -p 8080:80 --name apache2-ubuntu huezohuezo1990/apache2:bionic```



# pull apache2 + php

```docker pull huezohuezo1990/apache2:apache2php```

# run apache2 + php

```docker run -d --restart=always -p 80:80 --name apache2php-ubuntu huezohuezo1990/apache2:apache2php```

# run apache2 + php puerto 8081

```docker run -d --restart=always -p 8081:80 --name apache2php-ubuntu huezohuezo1990/apache2:apache2php```


## docker hub

## [https://hub.docker.com/r/huezohuezo1990/apache2/](https://hub.docker.com/r/huezohuezo1990/apache2/)


#  page
[https://huezo.github.io/docker-images/](https://huezo.github.io/docker-images/)
