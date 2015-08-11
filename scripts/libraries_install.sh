#! /bin/bash

# Success

REPLY=`whoami`

SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

USER=`who | awk '{print $1}' | sort -u`

# Directory this script is located in.
BASE_DIR=`pwd`

# TODO: Variable for this directory as the base station

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

# Install packages for levmar, lapack, and homest.

apt-get install liblapack-dev --yes
apt-get install libblas-dev checkinstall --yes
apt-get install libblas-doc checkinstall --yes
apt-get install liblapacke-dev checkinstall --yes
apt-get install liblapack-doc checkinstall --yes
apt-get install f2c --yes

add-apt-repository --yes ppa:xqms/opencv-nonfree
apt-get update
apt-get install libopencv-nonfree-dev --yes

echo "Making levmar..."

cd $SCRIPT_DIR/../levmar-2.6
rm CMakeCache.txt
cmake .
make clean
make

echo "Copying levmar.h to /usr/local/include..."
cp levmar.h /usr/local/include
echo "Copying liblevmar to /usr/local/lib..."
cp liblevmar.a /usr/local/lib

echo "Starting to make homest..."

cd $SCRIPT_DIR/../homest-1.4
rm CMakeCache.txt
cmake .
make clean
make

echo "Copying homest directory to /usr/local/include"
cp $SCRIPT_DIR/../homest-1.4/ /usr/local/include/ -r
echo "Copying libhomest to /usr/local/lib"
cp libhomest.a /usr/local/lib/
