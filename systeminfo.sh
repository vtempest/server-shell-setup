#!/bin/bash

# Bash script to show key info with emojis: 
# user ip isp domain os cpu disk_used top_process device pacman
# https://github.com/vtempest/server-setup-starter

system_info(){

    #user
    echo -ne "\e[31m👤$(whoami) "

    #hostname
    echo -ne "\e[91m🏠$(hostname)"

    #top_process
    export TOP_PROC=$(ps -eo pcpu,comm --sort=-%cpu --no-headers \
        | head -1 | sed 's/\.[0-9]/%/' | awk '{$1=$1};1' )
    echo -ne "\e[95m 🔝 $TOP_PROC"

    #disk_used
    export DISK_USED=$(df | grep '/$' | awk '{print $5}')
    echo -ne "\e[35m 📁  $DISK_USED"

    # Get IP info or exit with error message
    INFO=$(wget -qO- -T1 ipinfo.io 2>/dev/null) || { echo -e "\033[31m ❌ No internet connection"; exit 1; }

    # Extract info (IP and city will show regardless of domain presence)
    IP=$(echo "$INFO" | grep -oP 'ip"\s*:\s*"\K[^"]+' 2>/dev/null)
    CITY=$(echo "$INFO" | grep -oP 'city"\s*:\s*"\K[^"]+' 2>/dev/null)
    DOMAIN=$(echo "$INFO" | grep -oP 'hostname"\s*:\s*"\K[^"]+' 2>/dev/null)

    # network ip and external isp domain name
    [ -n "$IP" ] && echo -ne "\033[32m 🌎 ${IP:-No IP}"|| echo  -ne "\033[37m 🌎 No Network"
    [ -n "$CITY" ] && echo -ne "\033[32m 📍 ${CITY:-No City}"
    [ -n "$DOMAIN" ] && echo -ne "\033[37m 🔗 http://$DOMAIN" 

    #isp
    export ISP=$(echo $INFO | grep -oP 'org\": "\K[^"]+' | cut -f 1 -d ' ' --complement)
    echo -ne "\e[33m 👮 $ISP"

    #cpu
    export CPU=$(sed -n '/model name/p' /proc/cpuinfo | \
        cut -d':' -f2 | head -1 | awk '{$1=$1};1' )
    echo -ne "\e[91m 📈 $CPU"

    #os

    export OS=$([ -f /etc/os-release ] && grep -oP "^NAME=\"\K[^\"]+" /etc/os-release)
    echo -ne "\e[34m ⚡ $OS"
    
    #device
    if test -f /sys/devices/virtual/dmi/id/product_name; then
        DEVICE=$(cat /sys/devices/virtual/dmi/id/product_name  )
        echo -ne "\e[34m 💻 $DEVICE"
    fi

    #kernel
    export KERNEL=$(uname -r)
    echo -ne "\e[32m 🔧 $KERNEL"

    # package managers - system and languages
    # remove less common ones to save load time
    echo -ne "\e[31m 🚀"
    for cmd in "apt" "npm" "pip" "docker" "hx" "nvim" "bun" \
        # \ "pkg" "flatpak"  "yum" "snap" "pacman"\
        # \ "apk"  "brew" "yarn" "pnpm" "cargo" "gem" "go" 
    do
        if [ -x "$(command -v $cmd)" ]; then
            echo -ne " "$cmd;
        fi
    done

    #normal color 
    echo -e "\e[0m"
}

install_shell_greeting(){
    #silence the default text output messages
    sudo rm  /etc/motd; 
    sudo rm -rf  /etc/update-motd.d; 
    touch ~/.hushlogin; 

    cp systeminfo.sh ~/.config/systeminfo;

    #nushell
    echo "bash ~/.config/systeminfo/systeminfo.sh" >> $nu.config-path
}

#exec main
system_info
