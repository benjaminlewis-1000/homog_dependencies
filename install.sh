#! /bin/bash

REPLY=`whoami`

USER=`who | awk '{print $1}' | sort -u`

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

sudo add-apt-repository --yes ppa:xqms/opencv-nonfree
sudo apt-get update
sudo apt-get install libopencv-nonfree-dev --yes

echo "Making levmar..."

cd levmar-2.6
rm CMakeCache.txt
cmake .
make clean
make

echo "Copying levmar.h to /usr/local/include..."
cp levmar.h /usr/local/include
echo "Copying liblevmar to /usr/local/lib..."
cp liblevmar.a /usr/local/lib

echo "Starting to make homest..."

cd ../homest-1.4
rm CMakeCache.txt
cmake .
make clean
make

echo "Copying homest directory to /usr/local/include"
sudo cp ../homest-1.4/ /usr/local/include/ -r
echo "Copying libhomest to /usr/local/lib"
sudo cp libhomest.a /usr/local/lib/

# Now install database interface 

echo "Installing the database interface..." 

sudo apt-get install ros-indigo-sql-database --yes
sudo apt-get install pgadmin3 --yes
sudo apt-get install postgresql --yes

echo "Cloning the homography git repos..."
cd ../.. # Going into catkin_ws/src directory
ls

if ! [ -d "homography_calc" ]; then
	git clone https://github.com/speedyswimmer1000/homography_calc.git
else
	echo "Homography_calc already exists..."
fi

chown $USER homography_calc -R

if ! [ -d "ROScamPub" ]; then
	git clone https://github.com/speedyswimmer1000/ROScamPub.git
else
	echo "ROS cam pub already exists..."
fi

chown $USER ROScamPub -R

if ! [ -d "ueyeROS" ]; then
	git clone https://github.com/speedyswimmer1000/ueyeROS.git
else
	echo "ueyeROS already exists..."
fi

chown $USER ueyeROS -R

echo "Going to make catkin_ws now..."
cd ..

# Got to source the catkin files.
source /opt/ros/indigo/setup.bash
source devel/setup.bash

catkin_make

