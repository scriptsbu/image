#!/bin/bash
sudo apt update
sudo apt upgrade -y
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
echo "EDITING ALSA-BASE"
echo "options snd-hda-intel model=auto" | sudo tee -a /etc/modprobe.d/alsa-base.conf
echo "options snd-hda-intel dmic_detect=0" | sudo tee -a /etc/modprobe.d/alsa-base.conf
sudo alsa force-reload
sudo apt-get install pulseaudio-module-bluetooth
pactl load-module module-bluetooth-discover
sudo apt-get update && sudo apt-get upgrade -f -y
#systemctl --user unmask pulseaudio
#^^^ this command may slow down the distro
#====RE-ENABLING PIPEWIRE IF INSTALLED====IF app installed, then do this if not then reboot....
#echo "HERE 1"
if ! command -v pipewire &> /dev/null
then
#     echo "HERE 2"
        echo "Pipewire not found"
      systemctl --user --now enable pulseaudio.service pulseaudio.socket
      #=========================================
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
     fi
        # below code only runs if command exists
#systemctl --user unmask pipewire
#^^^ this command may slow down the distro
#echo "HERE 3"
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user --now enable pipewire{,-pulse}.{socket,service}
#=========================================
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
