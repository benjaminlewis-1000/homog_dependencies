#! /bin/bash

apt-get install expect

DIR=`pwd`

su - postgres -c $DIR/newUser.sh
