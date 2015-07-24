#! /bin/bash

REPLY=`whoami`

USER=`who | awk '{print $1}' | sort -u`

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

DIR=`pwd`

su - postgres -c "$DIR/newUser.sh benjamin"
su - postgres -c "$DIR/newUser.sh $USER"
su - postgres -c "$DIR/newUser.sh root"

# Create the databases.

createdb ESM_KEYFRAMES
createdb FIND_MATCH_KEYFRAMES
createdb FIND_ONLY_KEYFRAMES

# Populate the databases with the tables we have saved

psql ESM_KEYFRAMES < databases/esm.db
psql FIND_MATCH_KEYFRAMES < databases/findMatch.db
psql FIND_ONLY_KEYFRAMES < databases/findOnly.db

source /opt/ros/indigo/setup.bash
source /home/rransac1/vision_catkin/devel/setup.bash

rosrun homography_calc dbTest | grep passed
