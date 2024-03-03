#!/bin/bash

sudo apt clean
sudo rm -r /var/lib/dpkg/lock -y -f
sudo rm -r /var/lib/apt/lists/lock -y -f
sudo rm -r /var/lib/dpkg/lock-frontend -y -f
sudo rm -r /var/cache/apt/archives/lock -y -f
sudo dpkg --configure -a
echo "Done!"
