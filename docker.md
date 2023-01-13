## create docker network
```
docker network create mongo-network
```

## start mongodb
```
docker run -d \
  -p 27017:27017  \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password \
  --net mongo-network \
  --name mongodb \
  mongo
```

## start mongo-express
```
docker run -d \
  -p 8081:8081 \
  -e ME_CONFIG_MONGODB_ADMINUSENAME=admin \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
  -e ME_CONFIG_MONGODB_SERVER=mongodb \
  --net mongo-network \
  --name mongo-express \
  mongo-express
```

-----

> mongo-docker-compose.yaml
```yaml
version: '3'
services:
  mongodb:
    image: mongo
    ...

  mongo-express:
    image: mongo-express
    ports:
      - 8080:8080
    environment:
      - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
      - ME_CONFIG_MONGODB_ADMINPASSWORD=password
      - ME_CONFIG_MONGODB_SERVER=mongodb
```

```yaml
version: '3'
services:
  mongodb:
    image: mongo
    ...
  mongo-express:
    image: mongo-express
    ...
```

$ docker-compose -f mongo.yaml up

$ docker ps

<br>

```yaml
version: "3"

services:
  webserver:
  image: nginx:latest
  restart: always
  ports:
    - "8080:80"
  volumes:
    - ./websites:/usr/share/nginx/html
  depends_on:
    - db
  links:
    - db

  db:
    image: mysql:latest
    environment:
      - MYSQL_ROOT_PASSWORD=...
    restart: always
    volumes:
      - db_vol:/var/lib/mysql

volumes:
  db_vol:
```

$ docker-compose ps

$ docker-compose

$ docker-compose stop

$ docker-compose down

$ docker volume list

