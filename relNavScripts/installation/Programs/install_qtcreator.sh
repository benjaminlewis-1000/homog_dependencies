#!/bin/sh

# color functions
COFF="\033[0m"
function red    { echo -e "\033[1;31m$@ ${COFF}"; }
function green  { echo -e "\033[1;32m$@ ${COFF}"; }
function yellow { echo -e "\033[1;33m$@ ${COFF}"; }
function blue   { echo -e "\033[1;34m$@ ${COFF}"; }


#qtcreator
green "**************************Installing #QtCreator*********************************"
sudo apt-get -y install qtcreator
yellow "copying qtcreator.desktop file"
sudo cp qtcreator.desktop /usr/share/applications/qtcreator.desktop