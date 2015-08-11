#! /bin/bash


SCRIPT_DIR=`dirname "$(readlink -f "$0")"`
DIR=$HOME/catkin_ws/src

cd $DIR/homography_calc/scripts
pwd

su hex -c ./cleardatabase.sh
