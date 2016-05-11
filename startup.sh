#!/bin/bash

ip route change default via 172.17.42.254

/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh inifile="/opt/teamspeak3-server_linux_amd64/ts3server.ini"
