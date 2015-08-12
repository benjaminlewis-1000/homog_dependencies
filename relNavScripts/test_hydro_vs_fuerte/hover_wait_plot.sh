#~/bin/bash
 
rostopic pub -1 /waypoints relative_nav_msg/DesiredState "node_id: 0
pose:
  x: 0.0
  y: 0.0
  z: -0.8
  yaw: 0.0
velocity:
  x: 0.0
  y: 0.0
  z: 0.0
  yaw: 0.0
acceleration:
  x: 0.0
  y: 0.0
  z: 0.0
  yaw: 0.0" 

#echo "Waiting for 3 seconds"
#sleep 3
read -n1 -r -p "Start rosbag and then press any key to continue...  " key

#rosbag play ~/launch/fuerte_hover_origin.bag &
rqt_plot /mikoCmd/pitch:roll:yaw:throttle &
