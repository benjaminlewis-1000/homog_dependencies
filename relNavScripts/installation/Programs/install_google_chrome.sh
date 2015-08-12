#!/bin/sh

# color functions
COFF="\033[0m"
function red    { echo -e "\033[1;31m$@ ${COFF}"; }
function green  { echo -e "\033[1;32m$@ ${COFF}"; }
function yellow { echo -e "\033[1;33m$@ ${COFF}"; }
function blue   { echo -e "\033[1;34m$@ ${COFF}"; }


#Google Chrome
green "*************************Installing Google Chrome******************************"
sudo apt-get install libxss1
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt-get install -f
yellow "Copying google-chrome.desktop file"
sudo cp google-chrome.desktop /usr/share/applications/.
yellow "Removing google chrome install files"
rm google-chrome-stable_current_amd64.deb