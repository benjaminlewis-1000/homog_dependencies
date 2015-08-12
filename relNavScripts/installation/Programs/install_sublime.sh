#!/bin/bash

# color functions
COFF="\033[0m"
function red    { echo -e "\033[1;31m$@ ${COFF}"; }
function green  { echo -e "\033[1;32m$@ ${COFF}"; }
function yellow { echo -e "\033[1;33m$@ ${COFF}"; }
function blue   { echo -e "\033[1;34m$@ ${COFF}"; }

green "********************** Installing Sublime Text 3 ********************"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
