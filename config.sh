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

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

if [ "$(id -u)" == "0" ]; then
   echo "This script must not be run as root" 1>&2
   exit 1
fi

echo -e "\n\n${greenColour}[+] Getting Started !! ${endColour}\n\n"
sudo apt update

#   lemonbar  libxcb-ewmh2  libxcb-xtest0  sxhkd  xdo
echo -e "\n\n${greenColour}[+] Installing bspwm ${endColour}\n\n"
sudo apt install -y bspwm

echo -e "\n\n${greenColour}[+] Installing polybar ${endColour}\n\n"
sudo apt install -y polybar

echo -e "\n\n${greenColour}[+] Installing picom Compositor ${endColour}\n\n"
sudo apt install picom

echo -e "\n\n${greenColour}[+] Installing feh ${endColour}\n\n"
sudo apt install -y feh

echo -e "\n\n${greenColour}[+] Installing rofi ${endColour}\n\n"
sudo apt install -y rofi

echo -e "\n\n${greenColour}[+] Installing i3lock-fancy ${endColour}\n\n"
sudo apt install -y i3lock-fancy

echo -e "\n\n${greenColour}[+] Installing zsh ${endColour}\n\n"
sudo apt install -y zsh

echo -e "\n\n${greenColour}[+] Installing oh-my-zsh ${endColour}\n\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\n\n${greenColour}[+] Installing kitty Terminal ${endColour}\n\n"
sudo apt install -y kitty

echo -e "\n\n${greenColour}[+] Installing flameshot ${endColour}\n\n"
sudo apt install -y flameshot

echo -e "\n\n${greenColour}[+] Installing jgmenu menu system ${endColour}\n\n"
sudo apt install -y jgmenu

echo -e "\n\n${greenColour}[+] Installing dunst${endColour}\n\n"
sudo apt install -y dunst

echo -e "\n\n${greenColour}[+] Installing nitrogen${endColour}\n\n"
sudo apt install -y nitrogen

# Setting up Polywal-Themes
echo -e "\n\n${greenColour}[+] Installing pywal ${endColour}\n\n"
pipx install pywal

echo -e "\n\n${greenColour}[+] Installing calc ${endColour}\n\n"
sudo apt install -y calc


chmod +x "$SCRIPT_DIR/copy.sh"
echo -e "\n\n${greenColour}[+] Giving exec permission to ${SCRIPT_DIR}/copy.sh ${endColour}"
"$SCRIPT_DIR/copy.sh"

echo -e "\n\n${greenColour}[+] Setting up Polywal-Themes ${endColour}\n\n"
git clone --depth=1 https://github.com/hackthesys/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
"./setup.sh"