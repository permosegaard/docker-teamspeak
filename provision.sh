#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "Europe/London" > /etc/timezone && dpkg-reconfigure tzdata
apt-get update && apt-get install -qy iproute2

apt-get install -qy aufs-tools wget bzip2

apt-get clean && rm -Rf /var/lib/apt/lists/*
