#! /bin/bash

apt-get install expect

DIR=`pwd`

# OK, so that's working
su - postgres -c "$DIR/newUser.sh benjamin"
su - postgres -c "$DIR/newUser.sh $USER"
