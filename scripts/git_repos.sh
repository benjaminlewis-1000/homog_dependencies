#! /bin/bash

REPLY=`whoami`

USER=`who | awk '{print $1}' | sort -u`

CATKIN=$1

echo $CATKIN

if ! [ $REPLY == 'root' ]; then
	echo "You are not sudo. Please run as sudo."
	exit
fi

if  [ ! $1 ] || [ ! -d "$1" ] ; then
	echo "You have not input a valid directory for the catkin directory."
	exit
fi

if [ ! -d "$1/src" ] || [ ! -d "$1/build" ] || [ ! -d "$1/devel" ]; then
	echo "This isn't a catkin directory."
	exit
fi

# Go to the src directory.
cd $CATKIN/src

SRC_DIR=`pwd`

# Download all the git repos.

echo "Cloning the homography git repos..."

if ! [ -d "homography_calc" ]; then
	git clone https://github.com/speedyswimmer1000/homography_calc.git
else
	echo "Homography_calc already exists..."
fi

chown $USER homography_calc -R

if ! [ -d "ROScamPub" ] && ! [ -d "webcam_pub" ] ; then
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

if ! [ -d "relNav" ]; then
	git clone https://github.com/speedyswimmer1000/relNav.git
else
	echo "RelNav already exists..."
fi

chown $USER relNav -R

# Build ueye drivers

cd $SRC_DIR/ueyeROS/ueyeInstall
qmake .
make -j8
./install.run

$SRC_DIR/homography_calc/scripts/cleardatabase.sh

source $HOME/.bashrc

cd $CATKIN

source /opt/ros/indigo/setup.bash
source devel/setup.bash

catkin_make

# Write a correct test_dirs.param file for the database test.
cd $SRC_DIR/homography_calc/param
rm testdir.yaml
echo "/funcTestDir: $SRC_DIR/homography_calc/funcTesting" >> testdir.yaml
echo "/catkin_ws_dir: $CATKIN" >> testdir.yaml

# Rewrite the cleardatabase script.
cd $SRC_DIR/homography_calc/scripts
sed -i "s/benjamin/$USER/" cleardatabase.sh
sed -i "s/benjamin/$USER/" saveKeyframes.sh

su $USER -c ./cleardatabase.sh

# Run the test script for the database setup, see
# if everything passes.

cd $HOME

roslaunch homography_calc dbtest.launch 3>&1 1>/dev/null 2>&3- | grep passed
