FROM ubuntu:16.04

ADD startup.sh /root/
RUN echo "\
#!/bin/bash\
ip route change default via 172.17.42.254\
/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh inifile=\"/opt/teamspeak3-server_linux_amd64/ts3server.ini\"\
" > /root/startup.sh &&  chmod +x /root/startup.sh

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
    iproute2 wget bzip2
RUN apt-get clean && rm -Rf /var/lib/apt/lists/*

RUN wget -O teamspeak3-server_linux-amd64.tar.bz2 http://dl.4players.de/ts/releases/3.0.12.3/teamspeak3-server_linux_amd64-3.0.12.3.tar.bz2
RUN tar -C /opt -xjf teamspeak3-server_linux-amd64.tar.bz2 && rm teamspeak3-server_linux-amd64.tar.bz2

RUN echo "\
machine_id=\
default_voice_port=9987\
voice_ip=0.0.0.0\
licensepath=\
filetransfer_port=30033\
filetransfer_ip=0.0.0.0\
query_port=10011\
query_ip=0.0.0.0\
query_ip_whitelist=whitelist.txt\
query_ip_blacklist=blacklist.txt\
dbplugin=ts3db_sqlite3\
dbpluginparameter=\
dbsqlpath=sql/\
dbsqlcreatepath=create_sqlite/\
dbconnections=10\
logpath=logs/\
logquerycommands=0\
dbclientkeepdays=30\
logappend=0\
query_skipbruteforcecheck=0\
" > /opt/teamspeak3-server_linux_amd64/ts3server.ini

RUN echo -e "208.167.241.190\n208.167.241.185\n208.167.241.186\n108.61.78.147\n108.61.78.148\n108.61.78.149\n108.61.78.150" > /opt/teamspeak3-server_linux_amd64/whitelist.txt

ENTRYPOINT [ "/root/startup.sh" ]
