FROM ubuntu:16.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
    iproute2 wget bzip2
RUN apt-get clean && rm -Rf /var/lib/apt/lists/*

RUN wget -O teamspeak3-server_linux-amd64.tar.bz2 http://dl.4players.de/ts/releases/3.0.12.3/teamspeak3-server_linux_amd64-3.0.12.3.tar.bz2 && \
    tar -C /opt -xjf teamspeak3-server_linux-amd64.tar.bz2 && rm teamspeak3-server_linux-amd64.tar.bz2

ADD startup.sh /root/
RUN chmod +x /root/startup.sh

ENTRYPOINT [ "/root/startup.sh" ]
