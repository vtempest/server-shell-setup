

#UBUNTU install
alias i='sudo apt-get install -y '
alias rem='sudo apt remove -y'

#UBUNTU upgrade
alias u='sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y'

#reboot
alias rs='sudo reboot'
# shut down
alias die='sudo shutdown -r -n now'
#stop asking for sudo password
alias become_sudo="sudo echo '$USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"



#find process / kill
alias p="sudo ps aux | grep "
alias pk="sudo killall -9 "



#PORTS

port(){
  lsof -i tcp:${1};
}


kill_port(){
  sudo lsof -t -i tcp:${1} | xargs kill -9
}



disk_space(){
  sudo du -cha --max-depth=1 / | grep -E "M|G";
}



ipinfo(){
  #change to your device

  DEV='wlp4s0'


  IP=$(dig +short myip.opendns.com @resolver1.opendns.com);


  IPLOCAL=$(ip addr show dev ${DEV}  | grep "inet " | cut -d" " -f6 );

  IPHOST=$(host $IP | grep -oP '(?<=pointer ).*(?=.)');
  echo "IP: $IP\nDNS: $IPHOST \nLocal: $IPLOCAL \n"
}

getip(){
  echo $IP | clipcopy;
  echo $IP;
}
