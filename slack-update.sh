#!/bin/bash
cd Downloads
sudo pkill slack -f
sudo apt-get remove slack -y -f
sudo snap remove slack -y -f
sudo apt remove slack-desktop -y -f
sudo snap install slack
sudo apt-get update && apt-get upgrade -y -f
slack
while true;do
 

  read -p "Do you want to reboot now(Y/N)? " QUESTION
  
  case "${QUESTION}" in
    [Yy] ) 
      echo "Rebooting now..."    
       sudo reboot  
      ;;

    * ) 
      echo "Don't forget to Reboot the system to apply changes!"
      exit
      ;;
  esac
done
