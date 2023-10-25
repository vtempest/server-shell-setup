#!/bin/bash

# The Devil Is In The Defaults
# https://github.com/vtempest/server-setup-starter


# Show system info when opening shell



# print key system info with emoji symbols
# user ip isp os cpu disk_used top_process
system_info(){

    #user
    echo -ne "\e[31m👤 $(whoami)\e[0m@\e[91m$(hostname)"

    #top_process
    echo -ne "\e[95m 🔝  $(ps -eo pcpu,comm --sort=-%cpu --no-headers  | head -1 | sed 's/\.[0-9]/%/' | awk '{$1=$1};1' )"

    #disk_used
    echo -ne "\e[35m 📁  $(df | grep '/$' | awk '{print $5}')"

    #ip
    INFO=$(wget -qO- ipinfo.io )
    export IP=$(echo $INFO | grep -oP 'ip\": "\K[^"]+')
    echo -ne "\e[32m 🌎 $IP"

    #domain (if available)
    export DOMAIN=$(echo $INFO | grep -oP 'hostname\": "\K[^"]+')
    if [ $DOMAIN ]; then echo -ne "\e[37m 🤖$DOMAIN"; fi

    #isp
    export ISP=$(echo $INFO | grep -oP 'org\": "\K[^"]+'  | cut -f 1 -d ' ' --complement)
    echo -ne "\e[33m 👮 $ISP"

    #cpu
    echo -ne "\e[91m 📈  $(sed -n '/model name/p' /proc/cpuinfo | cut -d':' -f2 | head -1 | awk '{$1=$1};1' )"

    #os
    echo -ne "\e[34m 💻  $(cat /etc/*release| grep -oP -m1 "NAME=\"\K([^\"]*)")"
    
    #kernel
    echo -ne "\e[32m 🔧  $(uname -r)"

    # package managers - system and languages
    # remove less common ones to save load time
    echo -ne "\e[31m 🚀 "
    for cmd in "apt" "npm" "pip" "docker"\
        # \ "pkg" "flatpak"  "yum" "snap" "pacman"\
        # \ "apk"  "brew"
    do  
        if [ -x "$(command -v $cmd)" ]; then
            echo -ne " "$cmd;
        fi
    done

    
    #normal color 
    echo -e "\e[0m"

}


## silence the default text output messages
remove_default_shell_greeting(){
    sudo rm  /etc/motd; 
    sudo rm -rf  /etc/update-motd.d; 
    touch ~/.hushlogin; 
}


fish_install(){
    set -g fish_greeting "bash ~/.config/systeminfo.sh"
}





#exec main
system_info