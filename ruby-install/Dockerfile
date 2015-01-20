# Install Ubuntu with Ruby

FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

ADD sources.list /etc/apt/sources.list

RUN rm -rf /etc/apt/sources.list.d/*
RUN apt-get update && apt-get install -y build-essential wget

RUN cd /root && \
    wget https://github.com/postmodern/ruby-install/archive/master.tar.gz && \
    tar -zxvf master.tar.gz && cd ruby-install-master && \
    make install && \
    cd .. && \
    rm -rf ruby-install-master master.tar.gz
RUN ruby-install --system ruby
RUN gem install bundler

WORKDIR /root
