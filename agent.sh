#!/bin/bash

echo "Please insert syslog-ng server IP"
read IP 

if [[ $IP = "" ]];then
	echo "reject"
	exit 1
fi

cat << EOF >> /etc/rsyslog.conf
# provides UDP syslog reception
module(load="imudp")
input(type="imudp" port="514")
*.*	@$IP
EOF

/etc/init.d/rsyslog restart
