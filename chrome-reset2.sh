#!/bin/bash
echo -e "\x1b[41;37mATTENTION! THIS SCRIPT WILL RESET CHROME, AND YOU WILL LOSE ALL YOUR DATA(PASSWORD, BOOKMARKS,ETC.) - PRESS [ENTER] KEY TO PROCEED.\x1b[K\x1b[0m"
read -p ""
cd ~/Downloads
#===========================PASSWORDS=====================================
wget https://github.com/scriptsbu/iso_fix/raw/main/storage/retrieve_password.py
python3 retrieve_password.py
cat passwords.csv
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
sudo apt remove google-chrome-stable -f -y
sudo apt purge google-chrome-stable -f -y
sudo snap install chromium
exit
