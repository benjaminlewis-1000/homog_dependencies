#! /bin/bash


SCRIPT_DIR=`dirname "$(readlink -f "$0")"`
DIR=$HOME/catkin_ws/src

CATKIN=$HOME/catkin_ws
echo $CATKIN

$SCRIPT_DIR/create_catkin_ws.sh $CATKIN
