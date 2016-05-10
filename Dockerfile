FROM ubuntu:16.04

RUN apt-get update \
        && apt-get install -y wget bzip2 --no-install-recommends \
        && apt-get clean && rm -r /var/lib/apt/lists/*

ENV TEAMSPEAK_VERSION 3.0.12.3
ENV TEAMSPEAK_SHA1 d74d60853e6fb41be74d2dc198e37ab776a164fa

VOLUME [ "/teamspeak" ]

RUN wget -O teamspeak3-server_linux-amd64.tar.bz2 http://dl.4players.de/ts/releases/${TEAMSPEAK_VERSION}/teamspeak3-server_linux_amd64-${TEAMSPEAK_VERSION}.tar.bz2 \
        && echo "${TEAMSPEAK_SHA1} *teamspeak3-server_linux-amd64.tar.bz2" | sha1sum -c - \
        && tar -C /opt -xjf teamspeak3-server_linux-amd64.tar.bz2 \
        && rm teamspeak3-server_linux-amd64.tar.bz2

ADD startup.sh /root/
RUN chmod -x /root/startup.sh

ENTRYPOINT [ "/root/startup.sh" ]

EXPOSE 9987/udp
EXPOSE 30033
EXPOSE 10011
