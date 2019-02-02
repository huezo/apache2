# docker-images
Docker Image Apache2 Ubuntu


# pull apache2:latest

```docker pull huezohuezo1990/apache2:latest```

# run apache2:latest

```docker run -d  --restart=always  -p 80:80 --name apache2-ubuntu huezohuezo1990/apache2:latest```

## docker-compose.yml

```


version: '3'

services:
  apache:
#    restart: on-failure
    restart: always
    image: 'huezohuezo1990/apache2:latest'
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - 'apache2_volumen:/var/www/html/'
volumes:
  apache2_volumen:
    driver: local



```



Contenedor: 

```docker-compose up -d```

swarm y stack :

```docker stack deploy --compose-file=docker-compose.yml apache2-service```




# docker-compose.yml v3

```  docker stack deploy -c docker-compose.yml apache2  ```

```
version: "3"
services:
  apache2:
    image: huezohuezo1990/apache2:latest
    deploy:
      replicas: 1
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "80:80"
    networks:
      - apache2
networks:
  apache2:

```

```

version: "3"
services:
  apache2:
    image: huezohuezo1990/apache2:latest
    volumes:
       - apache2-volumen:/var/www/html/
    deploy:
      placement:
        constraints: [node.role == manager]
      replicas: 1
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "80:80"
    networks:
      - apache2
volumes:
  apache2-volumen:
networks:
  apache2:

  apache2:

```

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


## docker-compose.yml


```

version: '3'

services:
  apache:
#    restart: on-failure
    restart: always
    image: 'huezohuezo1990/apache2:bionic'
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - 'apache2_volumen:/var/www/html/'
volumes:
  apache2_volumen:
    driver: local



```

Contenedor: 

```docker-compose up -d```

swarm y stack :

```docker stack deploy --compose-file=docker-compose.yml apache2-service```


# docker-compose.yml v3

```  docker stack deploy -c docker-compose.yml apache2-bionic  ```

```
version: "3"
services:
  apache2:
    image: huezohuezo1990/apache2:bionic
    deploy:
      replicas: 1
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "80:80"
    networks:
      - apache2
networks:
  apache2:

```



or

run port 8080


```docker run -d --restart=always -p 8080:80 --name apache2-ubuntu huezohuezo1990/apache2:bionic```



# pull apache2 + php

```docker pull huezohuezo1990/apache2:apache2php```

# run apache2 + php

```docker run -d --restart=always -p 80:80 --name apache2php-ubuntu huezohuezo1990/apache2:apache2php```



## docker-compose.yml


```

version: '3'

services:
  apache:
#    restart: on-failure
    restart: always
    image: 'huezohuezo1990/apache2:apache2php'
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - 'apache2_volumen:/var/www/html/'
volumes:
  apache2_volumen:
    driver: local


```

Contenedor: 


```docker-compose up -d```

swarm y stack :

```docker stack deploy --compose-file=docker-compose.yml apache2php-service```


# docker-compose.yml v3

```  docker stack deploy -c docker-compose.yml apache2-php  ```

```
version: "3"
services:
  apache2:
    image: huezohuezo1990/apache2:apache2php
    deploy:
      replicas: 1
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "80:80"
    networks:
      - apache2
networks:
  apache2:

```


# run apache2 + php puerto 8081

```docker run -d --restart=always -p 8081:80 --name apache2php-ubuntu huezohuezo1990/apache2:apache2php```




## docker hub

## [https://hub.docker.com/r/huezohuezo1990/apache2/](https://hub.docker.com/r/huezohuezo1990/apache2/)


#  page
[https://huezo.github.io/docker-images/](https://huezo.github.io/docker-images/)
