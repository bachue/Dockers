#!/bin/bash
set -e

if [ "$1" = "boot" ]; then
    sed -i -e "s/^rpc_address.*/rpc_address: 0.0.0.0/" /etc/dse/cassandra/cassandra.yaml
    service dse start
    service datastax-agent start
    tailf /var/log/cassandra/output.log
fi

exec "$@"
