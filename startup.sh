#!/bin/bash

ip route change default via 172.17.42.254
env > /environment2.txt
cd /server/ && ./ts3server_minimal_runscript.sh inifile=./ts3server.ini
