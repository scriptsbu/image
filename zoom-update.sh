#!/bin/bash
cd Downloads
sudo apt-get purge zoom -f
sudo apt-get purge zoom-client -f
sudo rm -r  zoom_amd64.deb -f
sudo apt update -y
sudo pkill zoom -f
sudo pkill zoom-client -f
sudo apt remove zoom -f
sudo snap remove zoom-client -f
wget https://us05web.zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
sudo rm -r  zoom_amd64.deb
sudo dpkg --configure -a
sudo apt-get update && sudo apt-get upgrade -y
dpkg -l | grep zoom
zoom
