# docker-images
Docker Image Apache2 Ubuntu


# pull 

```docker pull huezohuezo1990/apache2```

# run

```docker run -d -p 80:80 --name apache2-ubuntu huezohuezo1990/apache2:latest```

or

run port 8080


```docker run -d -p 8080:80 --name apache2-ubuntu huezohuezo1990/apache2:latest```



# swarm service

```docker service create --name apache2-service -p 80:80 huezohuezo1990/apache2:latest```


or 

swarm service port 8080

```docker service create --name apache2-service -p 8080:80 huezohuezo1990/apache2:latest```
