#!/bin/python

import rospy
import numpy as np
import cv2
import argparse
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

parser = argparse.ArgumentParser(description="Video stream to ROSBAG.")
parser.add_argument('video', 	help='Name of topic')
args = parser.parse_args()

# ROS initialization
topic = '/camera/rgb'
rospy.init_node("video_publisher_node", anonymous=True)
video_publisher = rospy.Publisher(topic, Image)
waitlong  = rospy.Rate(1.0)
waitlong.sleep() #Needs to wait a little bit??

cap = cv2.VideoCapture(args.video)
bridge = CvBridge()

while(cap.isOpened() and not rospy.is_shutdown()):
  ret, frame = cap.read()
  gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

  cv2.imshow('frame',frame)
  video_publisher.publish(bridge.cv2_to_imgmsg(frame, "bgr8"))
  if cv2.waitKey(1) & 0xFF == ord('q'):
    break

cap.release()
cv2.destroyAllWindows()
