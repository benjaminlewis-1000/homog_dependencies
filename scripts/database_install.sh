#! /bin/bash

REPLY=`whoami`

SCRIPT_DIR=`dirname $0`

USER=`who | awk '{print $1}' | sort -u`

# Directory this script is located in.
BASE_DIR=`pwd`

# TODO: Variable for this directory as the base station

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

echo "Installing the database interface..." 

apt-get install ros-indigo-sql-database --yes
apt-get install pgadmin3 --yes
apt-get install postgresql --yes

service postgresql reload

CONFIG_DIR=`ps auwx | grep postgresql | grep -v grep | awk '{print $NF}' | sed 's/config_file=//' | sed 's/postgresql.conf//' | grep postgres`

cp $SCRIPT_DIR/../psqlConfig/* $CONFIG_DIR

apt-get install expect
# Currently in src/ueyeRos/ueyeInstall
cd $SCRIPT_DIR/..

# Call the script to create new users in the database.
# These users have root privileges, which is OK for what
# I'm doing. Root is going to install the databases.
su - postgres -c "$BASE_DIR/newUser.sh benjamin"
su - postgres -c "$BASE_DIR/newUser.sh $USER"
su - postgres -c "$BASE_DIR/newUser.sh root"

# Create the databases.

createdb ESM_KEYFRAMES
createdb FIND_MATCH_KEYFRAMES
createdb FIND_ONLY_KEYFRAMES

# Populate the databases with the tables we have saved

psql ESM_KEYFRAMES < $SCRIPT_DIR/../databases/esm.db
psql FIND_MATCH_KEYFRAMES < $SCRIPT_DIR/../databases/findMatch.db
psql FIND_ONLY_KEYFRAMES < $SCRIPT_DIR/../databases/findOnly.db
