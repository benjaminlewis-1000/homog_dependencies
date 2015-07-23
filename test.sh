#! /bin/bash

REPLY=`whoami`

USER=`who | awk '{print $1}' | sort -u`

echo $USER

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

cd ../..
pwd
source /opt/ros/indigo/setup.bash
source devel/setup.bash

catkin_make
