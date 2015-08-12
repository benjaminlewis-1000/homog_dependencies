#!/bin/bash

# color functions
COFF="\033[0m"
function red    { echo -e "\033[1;31m$@ ${COFF}"; }
function green  { echo -e "\033[1;32m$@ ${COFF}"; }
function yellow { echo -e "\033[1;33m$@ ${COFF}"; }
function blue   { echo -e "\033[1;34m$@ ${COFF}"; }

# Themes
green "******************** Unity Tweak Tool *******************"
sudo apt-get install -y unity-tweak-tool

green "******************** Numix Theme ****************"
yellow "Theme"
sudo add-apt-repository ppa:numix/ppa 
sudo apt-get update 
sudo apt-get install -y numix-gtk-theme numix-icon-theme-circle 
sudo apt-get install -y numix-wallpaper-notd

yellow "Icons"
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install -y numix-icon-theme numix-icon-theme-circle

# Dock
green "************** Docky *****************"
yellow "Installing Docky"
sudo apt-get install -y docky
