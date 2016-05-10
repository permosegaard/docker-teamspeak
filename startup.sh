#!/bin/bash

ip route change default via 172.17.42.254

ln -s /teamspeak/ts3server.sqlitedb /opt/teamspeak3-server_linux_amd64/ts3server.sqlitedb 

mkdir -p /teamspeak/files
if ! [ -L /opt/teamspeak3-server_linux_amd64/files ]
then
	rm -rf /opt/teamspeak3-server_linux_amd64/files
	ln -s /teamspeak/files /opt/teamspeak3-server_linux_amd64/files
fi

if [ -f /teamspeak/ts3server.ini ]
then
	/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh inifile="/teamspeak/ts3server.ini"
else
	/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh \
		query_ip_whitelist="/teamspeak/query_ip_whitelist.txt" \
		query_ip_backlist="/teamspeak/query_ip_blacklist.txt" \
		logpath="/teamspeak/logs/" \
		licensepath="/teamspeak/" \
		inifile="/teamspeak/ts3server.ini" \
		createinifile=1 
fi
