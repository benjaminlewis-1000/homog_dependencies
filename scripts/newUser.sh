#! /usr/bin/expect

# sudo apt-get install expect

# sudo su - postgres -c /home/benjamin/catkin_ws/src/dependencies/t2.sh

set user [lindex $argv 0];

spawn createuser -P -s -e $user
expect "Enter password for new role:"
send "hex\r"
expect "Enter it again:"
send "hex\r"
interact
