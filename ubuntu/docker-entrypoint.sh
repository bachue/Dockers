#!/bin/bash

if [ ! -d "/root/.ssh" ]; then
    ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa
fi

cd /root

exec "$@"
