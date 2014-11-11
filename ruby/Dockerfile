# Install Ubuntu with Ruby

FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

ADD sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y make wget

RUN cd /root && \
    wget https://github.com/postmodern/ruby-install/archive/master.tar.gz && \
    tar -zxvf master.tar.gz && cd ruby-install-master && \
    make install && \
    cd .. && \
    rm -rf ruby-install-master master.tar.gz
RUN ruby-install --system ruby

WORKDIR /root
