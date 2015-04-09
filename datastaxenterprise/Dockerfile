FROM dockerfile/java:oracle-java8
MAINTAINER Bachue Zhou "http://github.com/bachue"

RUN mkdir -p /data

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD DataStaxEnterprise-4.6.3.2015040116-linux-x64-installer.run /data/installer.run

RUN chmod +x /data/installer.run /docker-entrypoint.sh

RUN rm -rf /etc/apt/sources.list.d/* && \
    apt-get update && \
    apt-get install -y libjna-java python2.7 && \
    /data/installer.run --install_type simple --listen_address 127.0.0.1 --rpc_address 0.0.0.0 \
      --node_type search --mode unattended && \
    rm -rf /var/lib/apt/lists/ /tmp/* /data

RUN sed -i 's/\(ulimit -l unlimited\)/#\1/' /etc/init.d/dse

EXPOSE 7199 7000 7001 9160 9042 8012 61621 8983

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["boot"]
