#! /usr/bin/expect

# sudo apt-get install expect

# sudo su - postgres -c /home/benjamin/catkin_ws/src/dependencies/t2.sh

spawn createuser -P -s -e benjamin
expect "Enter password for new role:"
send "hex\r"
expect "Enter it again:"
send "hex\r"
interact
