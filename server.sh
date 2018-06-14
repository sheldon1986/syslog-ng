#!/bin/bash

docker run --privileged -p 514:514/udp -v /var/log/syslog-ng:/var/log/syslog-ng --name syslog-ng -d syslog-ng/cp
