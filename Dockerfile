FROM ubuntu:16.04

COPY startup.sh provision.sh /root/
RUN sleep 10 && \
    chmod +x /root/startup.sh /root/provision.sh && \
    /root/provision.sh

ENTRYPOINT /root/startup.sh
