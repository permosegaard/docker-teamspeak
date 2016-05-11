FROM ubuntu:16.04

RUN \
echo -e "\
#!/bin/bash\n\
ip route change default via 172.17.42.254\n\
/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh inifile=\"/opt/teamspeak3-server_linux_amd64/ts3server.ini\"\
" > /root/startup.sh && chmod +x /root/startup.sh;\
apt-get update;\
DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends iproute2 wget bzip2;\
apt-get clean && rm -Rf /var/lib/apt/lists/*;\
wget -O teamspeak3-server_linux-amd64.tar.bz2 http://dl.4players.de/ts/releases/3.0.12.3/teamspeak3-server_linux_amd64-3.0.12.3.tar.bz2;\
tar -C /opt -xjf teamspeak3-server_linux-amd64.tar.bz2 && rm teamspeak3-server_linux-amd64.tar.bz2;\
echo -e "\
machine_id=\n\
default_voice_port=9987\n\
voice_ip=0.0.0.0\n\
licensepath=\n\
filetransfer_port=30033\n\
filetransfer_ip=0.0.0.0\n\
query_port=10011\n\
query_ip=0.0.0.0\n\
query_ip_whitelist=whitelist.txt\n\
query_ip_blacklist=blacklist.txt\n\
dbplugin=ts3db_sqlite3\n\
dbpluginparameter=\n\
dbsqlpath=sql/\n\
dbsqlcreatepath=create_sqlite/\n\
dbconnections=10\n\
logpath=logs/\n\
logquerycommands=0\n\
dbclientkeepdays=30\n\
logappend=0\n\
query_skipbruteforcecheck=0\
" > /opt/teamspeak3-server_linux_amd64/ts3server.ini;\
echo -e \"208.167.241.190\n208.167.241.185\n208.167.241.186\n108.61.78.147\n108.61.78.148\n108.61.78.149\n108.61.78.150\" > /opt/teamspeak3-server_linux_amd64/whitelist.txt;\
"

ENTRYPOINT [ "/root/startup.sh" ]
