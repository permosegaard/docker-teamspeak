FROM ubuntu:16.04

COPY provision.sh /root/provision.sh
RUN bash /root/provision.sh

COPY startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

ENTRYPOINT [ "/root/startup.sh" ]
