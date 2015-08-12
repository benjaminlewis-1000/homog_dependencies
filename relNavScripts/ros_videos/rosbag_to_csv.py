#!/usr/bin/env python

import os.path
import sys
import rosbag
import argparse

def printAsCSV(A):
  for i,a in enumerate(A):
    print str(a),
    sys.stdout.softspace=0
    if i is len(A)-1:
      print "" #newline
    else:
      print ',',
      sys.stdout.softspace=0

parser = argparse.ArgumentParser(description="Quick access to data in ROSBAG.  Some plotting capabilities.")
parser.add_argument('rosbag',   help='Name of ROSBAG to open')
parser.add_argument('topic', 	help='Name of topic')
parser.add_argument('type', 	help='Type of topic')
args = parser.parse_args()

if not os.path.exists(args.rosbag):
	print "Cannot find specified filename: %s" % args.rosbag
	sys.exit(1)

#print "Reading topic '%s' from '%s.'" % (args.topic,args.rosbag)

bag = rosbag.Bag(args.rosbag)

for topic, msg, t, in bag.read_messages(topics=[args.topic]):
  if args.type == "Transform":
    printAsCSV([msg.translation.x, \
      msg.translation.y, \
      msg.translation.z, \
      msg.rotation.x, \
      msg.rotation.y, \
      msg.rotation.z, \
      msg.rotation.w, \
      t])
  elif args.type == "Evart":
    printAsCSV([msg.transform.translation.x, \
      msg.transform.translation.y, \
      msg.transform.translation.z, \
      msg.transform.rotation.x, \
      msg.transform.rotation.y, \
      msg.transform.rotation.z, \
      msg.transform.rotation.w, \
      msg.velocity.x, \
      msg.velocity.y, \
      msg.velocity.z, \
      msg.header.stamp])
  elif args.type == "VO":
    printAsCSV([msg.transform.translation.x, \
      msg.transform.translation.y, \
      msg.transform.translation.z, \
      msg.transform.rotation.x, \
      msg.transform.rotation.y, \
      msg.transform.rotation.z, \
      msg.transform.rotation.w, \
      int(msg.valid_transformation), \
      msg.new_keyframe_id, \
      int(msg.new_keyframe), \
      msg.current_keyframe_id, \
      msg.header.stamp, \
      t])
bag.close();
