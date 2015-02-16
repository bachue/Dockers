# Install Ubuntu Server
# Expose 22 port for ssh login
# Expose 445 port for samba file public sharing(will share /root for public access)

FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

RUN rm -rf /etc/apt/sources.list.d/*
RUN apt-get update && \
    apt-get install -y openssh-server vim build-essential gdb samba man-db silversearcher-ag git command-not-found command-not-found-data apt-file --no-install-recommends && \
    rm -rf /var/lib/apt/lists/
RUN apt-file update
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa

RUN echo 'root:bachue' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

ADD smb.conf /tmp/smb.conf
RUN cat /tmp/smb.conf >> /etc/samba/smb.conf

RUN perl -plne 'print "guest account = root" if(/map to guest/)' /etc/samba/smb.conf > /tmp/smb.conf
RUN mv /tmp/smb.conf /etc/samba/smb.conf

WORKDIR /root
EXPOSE 22
EXPOSE 445

CMD service samba start && /usr/sbin/sshd && bash
