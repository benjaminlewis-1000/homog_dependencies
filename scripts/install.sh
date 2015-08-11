#! /bin/bash

REPLY=`whoami`

SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

USER=`who | awk '{print $1}' | sort -u`

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

source vars.sh

# Create the catkin database

#$SCRIPT_DIR/create_catkin_ws.sh $CATKIN
#$SCRIPT_DIR/ros_install.sh
#$SCRIPT_DIR/openCV_install.sh
#$SCRIPT_DIR/libraries_install.sh
#$SCRIPT_DIR/database_install.sh
$SCRIPT_DIR/git_repos.sh $CATKIN

