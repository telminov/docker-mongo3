# docker-mongo3

Build
```
docker build -t telminov:mongo3 .
```

Run interactive
```
docker run -ti --rm --name=mongo3 -h mongo3 -p 27017:27017 -v /var/docker/mongo3/data:/data/db telminov/mongo3
```

Daemon
```
docker run -d --name=mongo3 -h mongo3 -p 27017:27017 -v /var/docker/mongo3/data:/data/db telminov/mongo3
```
