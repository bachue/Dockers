# Install Ubuntu Server

FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

RUN rm -rf /etc/apt/sources.list.d/*
RUN apt-get update && \
    apt-get install -y openssh-client \
                       ca-certificates \
                       vim \
                       git \
                       gdb \
                       build-essential \
                       man-db manpages-dev \
                       wget \
                       silversearcher-ag \
                       command-not-found command-not-found-data apt-file --no-install-recommends && \
    rm -rf /var/lib/apt/lists/
RUN apt-file update

RUN echo 'root:bachue' | chpasswd

WORKDIR /root
EXPOSE 22

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
