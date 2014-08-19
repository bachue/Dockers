FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

ADD sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y openssh-server vim build-essential
RUN mkdir /var/run/sshd

RUN echo 'root:bachue' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD /usr/sbin/sshd && bash
