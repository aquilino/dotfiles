#!/bin/bash

ip_address=$(cat /home/h1dr0/.config/bin/target | awk '{print $1}')
machine_name=$(cat /home/h1dr0/.config/bin/target | awk '{print $2}')

#ENABLED=
DISABLED=

if [ $ip_address ] && [ $machine_name ]; then
    echo " $ip_address - $machine_name"
fi
