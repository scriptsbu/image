#!/bin/bash
sudo apt update
echo -e "\x1b[41;37mATTENTION! THIS SCRIPT WILL RESET CHROME, AND YOU WILL LOSE ALL YOUR DATA(PASSWORD, BOOKMARKS,ETC.) - PRESS [ENTER] KEY TO PROCEED.\x1b[K\x1b[0m"
read -p ""
sudo apt purge google-chrome-stable
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt upgrade -y
exit
