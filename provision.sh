#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "Europe/London" > /etc/timezone && dpkg-reconfigure tzdata
apt-get update && apt-get install -qy iproute2

apt-get install -qy wget bzip2

mkdir /server/

wget -qO- http://dl.4players.de/ts/releases/3.0.12.3/teamspeak3-server_linux_amd64-3.0.12.3.tar.bz2 | tar -xj --strip-components 1 -C /server

apt-get clean && rm -Rf /var/lib/apt/lists/*
