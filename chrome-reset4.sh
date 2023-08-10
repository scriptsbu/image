#!/bin/bash
cd ~/Downloads
#===========================PASSWORDS=====================================
echo -e "\x1b[41;37mATTENTION! PRESS [ENTER] KEY TO OPEN CHROME AND MANUALLY BACKUP YOUR PASSWORDS AND BOOKMARKS.\x1b[K\x1b[0m"
read -p ""
google-chrome chrome://password-manager/settings
#===========================BOOKMARKS=====================================
googlechromebookmarks() {
  cat ~/.config/google-chrome/Default/Bookmarks | \
  grep -E '\"name|\"url' | \
  grep -vE '\"type\"\:' | \
  awk '{print $1 substr($0,index($0,$2))}' | \
  sed s'/^\"name\"\:/title \= /' | \
  sed s'/^\"url\"\:/url \= /' | \
  sed s'/\,$//' | \
  awk 'BEGIN { 
              title="";
              re=""
             }
             { 
              if ( $1 ~ /^url/) { 
                re=re""title"  "$0"\n\n";
              } else if ( $1 ~ /^title/ ) { 
                title=$0"\n"; 
              }
            } 
       END { 
        print re;
       }'
}
#============================================================================
echo -e "\x1b[41;37mATTENTION! YOU ARE ABOUT TO LOSE ALL YOUR CHROME DATA(PASSWORD, BOOKMARKS,ETC.) - PRESS [ENTER] KEY TO PROCEED.\x1b[K\x1b[0m"
read -p ""
sudo rm -r /opt/google/chrome -f
sudo apt remove google-chrome-stable -f -y
sudo apt purge google-chrome-stable -f -y
sudo snap install chromium
exit
