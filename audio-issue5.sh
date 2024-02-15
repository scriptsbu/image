#!/bin/bash
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream -y
sudo apt update
sudo apt install pipewire -y -f
sudo apt install libspa-0.2-bluetooth -y -f
sudo apt install pipewire-audio-client-libraries -y -f
systemctl --user daemon-reload
systemctl --user --now disable pulseaudio.service pulseaudio.socket
#systemctl --user mask pulseaudio
#^^^ this command may slow down the distro
systemctl --user --now enable pipewire-media-session.service
pactl info
systemctl --user restart pipewire 
sudo apt remove ofono -y -f
sudo apt remove ofono-phonesim -y -f
sudo apt update -y -f
sudo apt upgrade -y -f
sudo apt autoremove -y -f
echo "Done!"
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
