#!/bin/bash
cd Downloads
sudo apt update -y
sudo pkill zoom -f
sudo pkill zoom-client -f
sudo apt remove zoom -f
sudo snap remove zoom-client -f
wget https://us05web.zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb -y
sudo rm -r  zoom_amd64.deb
dpkg -l | grep zoom
zoom
