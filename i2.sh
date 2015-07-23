#! /bin/bash

REPLY=`whoami`

USER=`who | awk '{print $1}' | sort -u`

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

CONFIG_DIR=`ps auwx | grep postgresql | grep -v grep | awk '{print $NF}' | sed 's/config_file=//' | sed 's/postgresql.conf//' | tail -n 1`

cp dbFiles/* $CONFIG_DIR

service postgresql reload

#su - postgres
#CREATE ROLE benjamin LOGIN CREATEDB CREATEROLE PASSWORD 'hex'
#createuser benjamin -D -r -l -W
#echo hex
