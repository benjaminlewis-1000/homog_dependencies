#! /bin/bash

REPLY=`whoami`

SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

USER=`who | awk '{print $1}' | sort -u`

if ! [ $REPLY == 'root' ]; then
        echo "You are not sudo. Please run as sudo."
        exit
fi

apt-get install ros-indigo-mavlink -y
apt-get install ros-indigo-mavros -y 
apt-get install ros-indigo-mavros-extras -y
