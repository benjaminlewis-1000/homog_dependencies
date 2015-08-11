#! /bin/bash

DIR=$HOME/catkin_ws/src

rm testdir.yaml

echo "/funcTestDir: $DIR/homography_calc/funcTesting" >> testdir.yaml
echo "/catkin_ws_dir: $HOME/catkin_ws" >> testdir.yaml
