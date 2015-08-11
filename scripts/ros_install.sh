#! /bin/bash

# Reasonable assumption: Running ubuntu 14.04 or later.

# Works on a system with ROS installed already.
# Works on a blank system as well. 

# Figure out who is running this script. Root for sudo.
REPLY=`whoami`

# Host directory of the script
SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

# A normal user of the system. 
USER=`who | awk '{print $1}' | sort -u`

# Directory this script is located in.
BASE_DIR=`pwd`

# TODO: Variable for this directory as the base station

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

# Direct from the ROS installation site, with defaults for 'yes' on the
# apt-gets. 
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

apt-get update

sudo apt-get install ros-indigo-desktop-full -y

# Run rosdep init and update as user rather than sudo. 
# The system complains if these are run as sudo.
rosdep init >/dev/null
su $USER -c 'rosdep update'

REPLY=`grep 'indigo/setup.bash' $HOME/.bashrc`

if [ $REPLY =~ setup$ ]; then  # We don't have it in our bashrc yet
	echo "source /opt/ros/indigo/setup.bash" >> $HOME/.bashrc
	source $HOME/.bashrc
fi

apt-get install python-rosinstall -y
