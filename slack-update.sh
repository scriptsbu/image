#!/bin/bash
cd Downloads
sudo pkill slack -f
sudo apt-get remove slack -y -f
sudo snap remove slack -y -f
sudo apt remove slack-desktop -y -f
sudo snap install slack
sudo apt-get update && apt-get upgrade -y -f
slack
