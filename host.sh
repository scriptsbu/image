#!/usr/bin/env bash
sudo chmod 777 /etc/hosts
sudo rm /etc/hosts
echo "127.0.0.1       localhost" | sudo tee -a /etc/hosts
echo "127.0.1.1       $HOSTNAME" | sudo tee -a /etc/hosts
echo "" | sudo tee -a /etc/hosts
echo "# The following lines are desirable for IPv6 capable hosts" | sudo tee -a /etc/hosts
echo "::1     ip6-localhost ip6-loopback" | sudo tee -a /etc/hosts
echo "fe00::0 ip6-localnet" | sudo tee -a /etc/hosts
echo "ff00::0 ip6-mcastprefix" | sudo tee -a /etc/hosts
echo "ff02::1 ip6-allnodes" | sudo tee -a /etc/hosts
echo "ff02::2 ip6-allrouters" | sudo tee -a /etc/hosts
sudo chmod 644 /etc/hosts
cat /etc/hosts
