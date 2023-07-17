#!/bin/bash
sudo apt update
sudo apt full-upgrade -y
echo "Enabling BLUETOOTH"
sudo service bluetooth enable
sudo service bluetooth start
echo "INSTALLING BLUE MANAGER AND TOOLS"
sudo apt-get install blueman  && blueman-manager && bluez bluetooth -y
sudo apt-get install bluez bluez-tools rfkill -y
sudo apt-get update
echo "CHECKING IF BLUETOOTH IS BLOCKED"
sudo rfkill list   
sudo rfkill unblock bluetooth
echo "RESTARTING BLUETOOTH"
sudo service bluetooth restart
sudo journalctl -b | grep blueman
echo "CHECKING FOR SND_HDA_INTEL MODULE"
sudo ls mod | grep snd_hda_intel
echo "CHECKING FOR DRIVER IN USE"
sudo lspci -nnk | grep -A2 Audio
echo "ALSA BASE RE-INSTALL"
sudo apt-get remove --purge alsa-base pulseaudio
sudo apt-get install alsa-base pulseaudio
echo "EDITING ALSA-BASE"
echo "options snd-hda-intel model=generic" | sudo tee -a /etc/modprobe.d/alsa-base.conf
echo "options snd-hda-intel model=auto" | sudo tee -a /etc/modprobe.d/alsa-base.conf
echo "options snd-hda-intel dmic_detect=0" | sudo tee -a /etc/modprobe.d/alsa-base.conf
sudo alsa force-reload
sudo apt-get update
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
