#! /bin/bash

REPLY=`whoami`

USER=`who | awk '{print $1}' | sort -u`

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

# Install packages for levmar, lapack, and homest.

apt-get remove liblapack-dev --yes
apt-get remove libblas-dev --yes
apt-get remove libblas-doc --yes
apt-get remove liblapacke-dev --yes
apt-get remove liblapack-doc --yes
apt-get remove f2c --yes
apt-get remove libopencv-nonfree-dev --yes
apt-get remove ros-indigo-sql-database --yes
apt-get remove pgadmin3 --yes
apt-get remove postgresql --yes

apt-get update

rm /usr/local/include/levmar.h
rm /usr/local/lib/liblevmar.a
rm /usr/local/include/homest-1.4/ -rf
rm /usr/local/lib/libhomest.a

rm -rf ../homography_calc/
rm -rf ../ueyeROS/
rm -rf ../ROScamPub/
rm -rf ../../devel/
rm -rf ../../build/


