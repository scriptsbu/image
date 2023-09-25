!/bin/bash
echo -e "\x1b[41;37mSelect option 1 to diagnose the issue; otherwise, select option 2 to fix it.\x1b[K\x1b[0m"
PS3=''
options=("Option 1-Diagnose" "Option 2-Fix" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1-Diagnose")
            cd  /var/lib/dpkg/status &&
            scp -r lock$USER.txt wifi@10.20.240.3:/debug/wifi/lock$USER.txt && 
            echo -e "\x1b[41;37mLog sent.\x1b[K\x1b[0m" && echo -e "\x1b[41;37mLook for: 'not-installed, config-files, half-installed, unpacked, half-configured, triggers-awaited, triggers-pending.'\x1b[K\x1b[0m"
            read -p ""
            ;;
        "Option 2-W/O Fix")
            sudo dpkg --configure -a
            echo -e "\x1b[41;37mAll Done!\x1b[K\x1b[0m"
            read -p ""
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
exit
