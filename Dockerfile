FROM ubuntu:16.04
MAINTAINER sheldon <sheldon@code-post.com>

RUN apt-get update -qq && apt-get install -y \
    syslog-ng \
    wget \
    vim

ADD syslog-ng.conf /etc/syslog-ng/conf.d/syslog-ng.conf

RUN echo 'SYSLOGNG_OPTS="--no-caps"' >> /etc/default/syslog-ng && useradd ubuntu && mkdir -p /var/log/syslog-ng

EXPOSE 514/udp
VOLUME ["/var/log/syslog-ng"]

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
