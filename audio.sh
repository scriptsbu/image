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
sudo apt-get update && apt-get upgrade -f -y
systemctl --user unmask pulseaudio
systemctl --user --now enable pulseaudio.service pulseaudio.socket
#====RE-ENABLING PIPEWIRE IF INSTALLED====
   if ! [ -x "$(command dpkg -l | grep pipewire)" ]; then 
        echo "Pipewire not found"
   fi
        # below code only runs if command exists
systemctl --user unmask pipewire
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
