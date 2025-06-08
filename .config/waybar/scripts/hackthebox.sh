#!/bin/bash

ip_address=$(/usr/sbin/ifconfig tun0 2>/dev/null | grep 'inet ' | awk '{print $2}')

#INIT=

if [ $ip_address ]; then
	#echo"$INIT $ip_address"
	echo "$ip_address"
fi