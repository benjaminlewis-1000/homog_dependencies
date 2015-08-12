#!/bin/python

import os.path
import sys
import rosbag
import argparse
import matplotlib.pyplot as plt
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv
import cv2

parser = argparse.ArgumentParser(description="Quick access to data in ROSBAG.  Some plotting capabilities.")
parser.add_argument('rosbag',   help='Name of ROSBAG to open')
parser.add_argument('topic', 	help='Name of topic')
parser.add_argument('--text',  action='store_true', help='Flag to display text to screen')
args = parser.parse_args()

if not os.path.exists(args.rosbag):
	print "Cannot find specified filename: %s" % args.rosbag
	sys.exit(1)

bag = rosbag.Bag(args.rosbag)
count = 0
bridge = CvBridge()

for topic, msg, t, in bag.read_messages(topics=[args.topic]):
	count = count + 1
	try:
		cv_image = bridge.imgmsg_to_cv(msg, msg.encoding);
	except CvBridgeError, e:
		print e 
	timestr = "%.6f" % msg.header.stamp.to_sec()
	
	image_name = msg.encoding+"_"+timestr+".png"
	#cv.SaveImage(image_name, cv_image);
	cv2.imwrite(image_name, cv_image);

bag.close();

print 'count: ', count
print 'all done'
