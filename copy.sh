#!/bin/bash

# Author: Omran Alshehabi (aka @HackTheSys)

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n${turquoiseColour}[!] Exiting...\n${endColour}"
	exit 1
}

# Configuration

echo -e "\n\n${greenColour}[+] Configuring scripts... ${endColour}\n\n"
cp -rv .config/*  ~/.config/

echo -e "\n\n${greenColour}[+] Configuring necessary permissions... ${endColour}"
chmod -R +x ~/.config/bspwm/

