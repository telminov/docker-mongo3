# docker build -t telminov:mongo3 .
# docker run -ti --rm --name=mongo3 -h mongo3 -p 27017:27017 -v /var/docker/mongo3/data:/data/db telminov/mongo3
# docker run -d --name=mongo3 -h mongo3 -p 27017:27017 -v /var/docker/mongo3/data:/data/db telminov/mongo3

FROM ubuntu:14.04
MAINTAINER telminov@soft-way.biz

# Expose port 27017 from the container to the host
EXPOSE 27017

# database directory
VOLUME /data/db

# install package
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" > /etc/apt/sources.list.d/mongo3.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7F0CEB10
RUN apt-get -qq update
RUN apt-get install mongodb-org -y

# Create data directory
RUN mkdir -p /data/db
RUN chown mongodb:mongodb /data/db

# Create log directory
RUN mkdir -p /var/log/mongodb
RUN chown mongodb:mongodb /var/log/mongodb

# Create conf directory
RUN mkdir -p /etc/mongodb

# Copy default conf
COPY mongod.conf /etc/mongodb/mongod.conf

#ENTRYPOINT [ "/usr/bin/mongod", "--config", "/etc/mongodb/mongod.conf" ]
#CMD []

CMD [ "/usr/bin/mongod", "--config", "/etc/mongodb/mongod.conf" ]