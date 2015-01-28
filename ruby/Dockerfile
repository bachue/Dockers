# Install Ubuntu with Ruby

FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.0

ADD sources.list /etc/apt/sources.list
ADD gemrc /root/.gemrc

RUN rm -rf /etc/apt/sources.list.d/*
RUN apt-get update && \
    apt-get install -y build-essential wget libffi-dev libssl-dev zlib1g-dev libreadline-dev --no-install-recommends && \
    rm -rf /var/lib/apt/lists/

RUN cd /root && \
    wget -nv http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2 -O ruby.tar.bz2 && \
    tar jxvf ruby.tar.bz2 && \
    cd ruby-$RUBY_VERSION && \
    ./configure --disable-install-rdoc --disable-install-capi --disable-install-doc && \
    make -j"$(nproc)" && \
    make install && \
    cd .. && \
    rm -rf ruby-$RUBY_VERSION ruby.tar.bz2

RUN gem install bundler

WORKDIR /root
