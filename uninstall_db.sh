#! /bin/bash

REPLY=`whoami`

USER=`who | awk '{print $1}' | sort -u`

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

dropdb FIND_ONLY_KEYFRAMES
dropdb FIND_MATCH_KEYFRAMES
dropdb ESM_KEYFRAMES

su - postgres -c "dropuser root"
su - postgres -c "dropuser benjamin"
su - postgres -c "dropuser hex"

apt-get remove pgadmin3 --yes
apt-get remove postgresql --yes

apt-get update
