!/bin/bash
echo -e "\x1b[41;37mSelect option 1 to diagnose the issue; otherwise, select option 2 to fix it.\x1b[K\x1b[0m"
PS3=''
options=("Option 1-Diagnose" "Option 2-Fix" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1-Diagnose")
            sudo cp  /var/lib/dpkg/status /home/$USER/Desktop
            sudo nautilus /home/$USER/Desktop
            echo -e "\x1b[41;37mSend log to IT thru Slack.\x1b[K\x1b[0m" && echo -e "\x1b[41;37mLook for: 'not-installed, config-files, half-installed, unpacked, half-configured, triggers-awaited, triggers-pending. Press ENTER to continue.'\x1b[K\x1b[0m"
            read -p ""
            ;;
        "Option 2-W/O Fix")
            sudo dpkg --configure -a
            echo -e "\x1b[41;37mLook for the package causing the issue on the next window and erase the whole block. Press ENTER to continue!\x1b[K\x1b[0m"
            read -p ""
            sudo nano /var/lib/dpkg/status
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
exit
