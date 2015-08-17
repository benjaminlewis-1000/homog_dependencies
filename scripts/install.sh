#! /bin/bash

REPLY=`whoami`

SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

USER=`who | awk '{print $1}' | sort -u`

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

CATKIN=$HOME/catkin_ws

FINDONLY_DB=FIND_ONLY_KEYFRAMES
FINDMATCH_DB=FIND_MATCH_KEYFRAMES
ESM_DB=ESM_KEYFRAMES

# Create the catkin database

$SCRIPT_DIR/ros_indigo_install.sh
$SCRIPT_DIR/openCV_install.sh
$SCRIPT_DIR/create_catkin_ws.sh $CATKIN
$SCRIPT_DIR/libraries_install.sh
$SCRIPT_DIR/mavlink.sh
$SCRIPT_DIR/database_install.sh $FINDONLY_DB $FINDMATCH_DB $ESM_DB
$SCRIPT_DIR/ros_packages
$SCRIPT_DIR/git_repos.sh $CATKIN

source $HOME/.bashrc
