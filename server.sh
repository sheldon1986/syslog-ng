#!/bin/bash

docker run --privileged -p 514:514/udp --name syslog-ng -d syslog-ng/cp
