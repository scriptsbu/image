!/bin/bash
sudo apt-get update
echo "INSTALLING XRDP"
sudo apt-get install xrdp
sudo systemctl start xrdp
sudo systemctl enable xrdp
echo "CREATING SYMLINK"
/usr/lib/x86_64-linux-gnu $ ln -s libffi.so.7 libffi.so.6
echo "INSTALLING INTEL MEDIA DRIVER"
sudo apt-get install intel-media-va-driver-non-free
sudo apt update
sudo apt upgrade
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