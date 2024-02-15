#!/bin/bash
sudo add-apt-r-epository ppa:pipewire-debian/pipewire-upstream -y -f
sudo apt update
sudo apt install pipewire -y -f
sudo apt install libspa-0.2-bluetooth
sudo apt install pipewire-audio-client-libraries
systemctl --user daemon-reload
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user mask pulseaudio
systemctl --user --now enable pipewire-media-session.service
pactl info
systemctl --user restart pipewire 
sudo apt remove ofono -y -f
sudo apt remove ofono-phonesim -y -f
systemctl --user unmask pipewire
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user --now enable pipewire{,-pulse}.{socket,service}
echo "Done!"
