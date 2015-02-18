# Install Ubuntu Server
# Expose 22 port for ssh login
# Expose 445 port for samba file public sharing(will share /root for public access)

FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

RUN rm -rf /etc/apt/sources.list.d/*
RUN apt-get update && \
    apt-get install -y openssh-server vim build-essential gdb man-db silversearcher-ag git command-not-found command-not-found-data apt-file --no-install-recommends && \
    rm -rf /var/lib/apt/lists/
RUN apt-file update
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa

RUN git clone git://github.com/bachue/My-Git-Config.git /root/.gitconf && \
    ln -s /root/.gitconf/.gitconfig /root/.gitconfig && \
    ln -s /root/.gitconf/.gitignore_global /root/.gitignore_global

RUN git clone git://github.com/bachue/GDB-Config.git /root/.gdbconf && \
    ln -s /root/.gdbconf/gdbinit /root/.gdbinit

RUN echo 'root:bachue' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

WORKDIR /root
EXPOSE 22
EXPOSE 445

CMD /usr/sbin/sshd && bash
