FROM ubuntu:16.04

COPY provision.sh /root/provision.sh
RUN bash /root/provision.sh

ENTRYPOINT [ "/root/startup.sh" ]
