#!/bin/bash

sudo apt clean
sudo rm /var/lib/dpkg/lock -f
sudo rm /var/lib/apt/lists/lock -f
sudo rm /var/lib/dpkg/lock-frontend -f
sudo rm /var/cache/apt/archives/lock -f
sudo dpkg --configure -a
echo "Done!"
