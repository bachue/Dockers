# Install Ubuntu with Ruby

FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

ADD sources.list /etc/apt/sources.list
ADD gemrc /root/.gemrc

RUN rm -rf /etc/apt/sources.list.d/*
RUN apt-get update && apt-get install -y build-essential wget libffi-dev libssl-dev zlib1g-dev libreadline-dev

RUN cd /root && \
    wget -nv http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2 -O ruby.tar.bz2 && \
    tar jxvf ruby.tar.bz2 && \
    cd ruby-2.2.0 && \
    ./configure --disable-install-rdoc --disable-install-capi --disable-install-doc && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf ruby-2.2.0 ruby.tar.bz2

RUN gem install bundler

WORKDIR /root
