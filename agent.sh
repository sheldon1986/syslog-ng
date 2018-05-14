#!/bin/bash

cat << EOF >> /etc/rsyslog.conf
# provides UDP syslog reception
module(load="imudp")
input(type="imudp" port="514")
*.*	@[syslog-ng server IP]
EOF
