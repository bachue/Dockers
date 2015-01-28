# Install Ubuntu Server
# Expose 22 port for ssh login
# Expose 445 port for samba file public sharing(will share /root for public access)

FROM ubuntu:trusty
MAINTAINER Bachue Zhou "http://github.com/bachue"

RUN apt-get update && \
    apt-get install -y postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3 postgresql-plpython-9.3 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.3/main/postgresql.conf
RUN locale-gen en_US.UTF-8

ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

WORKDIR /root
EXPOSE 5432

CMD service postgresql start && bash
