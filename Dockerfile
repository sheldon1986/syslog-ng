FROM ubuntu:16.04
MAINTAINER sheldon <sheldon@code-post.com>

RUN apt-get update -qq && apt-get install -y \
    syslog-ng \
    wget \
    vim


RUN wget -P /etc/syslog-ng/conf.d/ http://brezular.com/wp-content/uploads/2016/12/firewals.conf_.txt -O firewals.conf && mv firewals.conf /etc/syslog-ng/conf.d/ && echo 'SYSLOGNG_OPTS="--no-caps"' >> /etc/default/syslog-ng 
RUN useradd ubuntu && mkdir -p /var/log/firewalls

EXPOSE 514/udp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
