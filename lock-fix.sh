#!/bin/bash
sudo apt clean -y -f
sudo rm /var/lib/dpkg/lock -y -f
sudo rm /var/lib/apt/lists/lock -y -f
sudo rm /var/lib/dpkg/lock-frontend -y -f
sudo rm /var/cache/apt/archives/lock -y -f
sudo dpkg --configure -a -y -f
echo "Done!"
