#!/bin/bash

ip route change default via 172.17.42.254

if [ -f /opt/teamspeak3-server_linux_amd64/ts3server.ini ]
then
	/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh inifile="/opt/teamspeak3-server_linux_amd64/ts3server.ini"
else
	echo -e "208.167.241.190\n208.167.241.185\n208.167.241.186\n108.61.78.147\n108.61.78.148\n108.61.78.149\n108.61.78.150" > /opt/teamspeak3-server_linux_amd64/query_ip_whitelist.txt
	/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh \
		query_ip_whitelist="/opt/teamspeak3-server_linux_amd64/query_ip_whitelist.txt" \
		query_ip_backlist="/opt/teamspeak3-server_linux_amd64/query_ip_blacklist.txt" \
		logpath="/opt/teamspeak3-server_linux_amd64/logs/" \
		licensepath="/opt/teamspeak3-server_linux_amd64/" \
		inifile="/opt/teamspeak3-server_linux_amd64/ts3server.ini" \
		createinifile=1 
fi
