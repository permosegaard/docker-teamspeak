#!/bin/bash

if [ -f /overlay/.pause ]; then read -p "pausing..."; fi

ip route change default via 172.17.42.254

if [ ! -f /overlay/.provisioned ]; then mkdir -p /overlay/server /server/; fi
mount -t aufs -o noxino -o br=/overlay/server=rw none /server

if [ ! -f /overlay/.provisioned ]
then
  wget -qO- http://dl.4players.de/ts/releases/3.0.12.3/teamspeak3-server_linux_amd64-3.0.12.3.tar.bz2 | tar -xj --strip-components 1 -C /server
  
  if [ ! -f /server/ts3server.ini ]
  then
    tee /server/ts3server.ini <<EOF
machine_id=
default_voice_port=${PORT_9987}
voice_ip=0.0.0.0
licensepath=
filetransfer_port=${PORT_30033}
filetransfer_ip=0.0.0.0
query_port=${PORT_10011}
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
    fi
  
  touch /overlay/.provisioned
fi

cd /server/ && ./ts3server_minimal_runscript.sh inifile=./ts3server.ini
