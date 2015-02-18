#!/bin/bash

set -e

if [ ! -d "/root/.ssh" ]; then
    ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa
fi

if [ -d "/root/.gitconf" ]; then
    cd /root/.gitconf
    git pull --rebase origin master
else
    git clone git://github.com/bachue/My-Git-Config.git /root/.gitconf
    ln -s /root/.gitconf/.gitconfig /root/.gitconfig
    ln -s /root/.gitconf/.gitignore_global /root/.gitignore_global
fi

if [ -d "/root/.gdbconf" ]; then
    cd /root/.gdbconf
    git pull --rebase origin master
else
    git clone git://github.com/bachue/GDB-Config.git /root/.gdbconf
    ln -s /root/.gdbconf/gdbinit /root/.gdbinit
fi

cd /root

exec "$@"
