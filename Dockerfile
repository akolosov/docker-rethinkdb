FROM akolosov/ubuntu

MAINTAINER Alexey Kolosov <alexey.kolosov@gmail.com>

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 1614552E5765227AEC39EFCFA7E00EF33A8F2399
RUN echo "deb http://download.rethinkdb.com/apt trusty main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.0.1~0trusty

RUN apt-get update && \
	  apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION && \
	  rm -rf /var/lib/apt/lists/*

VOLUME ["/data/db", "/data/logs"]

WORKDIR /data

RUN mkdir -p /data/db
RUN mkdir -p /data/logs

ENV SHELL /bin/bash

ENTRYPOINT ["/usr/bin/rethinkdb", "--directory", "/data/db", "--log-file", "/data/logs/rethinkdb.log"]

EXPOSE 28015 29015 8080