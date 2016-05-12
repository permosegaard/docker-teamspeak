#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -qy iproute2 
apt-get install -qy wget bzip2

mkdir /server/

wget -qO- http://dl.4players.de/ts/releases/3.0.12.3/teamspeak3-server_linux_amd64-3.0.12.3.tar.bz2 | tar -xj -C /server

tee /server/ts3server.ini <<EOF
machine_id=
default_voice_port=9987
voice_ip=0.0.0.0
licensepath=
filetransfer_port=30033
filetransfer_ip=0.0.0.0
query_port=10011
query_ip=0.0.0.0
query_ip_whitelist=whitelist.txt
query_ip_blacklist=blacklist.txt
dbplugin=ts3db_sqlite3
dbpluginparameter=
dbsqlpath=sql/
dbsqlcreatepath=create_sqlite/
dbconnections=10
logpath=logs/
logquerycommands=0
dbclientkeepdays=30
logappend=0
query_skipbruteforcecheck=0
EOF

tee /server/whitelist.txt <<EOF
208.167.241.190
208.167.241.185
208.167.241.186
108.61.78.147
108.61.78.148
108.61.78.149
108.61.78.150
EOF

apt-get clean && rm -Rf /var/lib/apt/lists/*
