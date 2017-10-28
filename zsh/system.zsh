
# Ubuntu Gnome packages & dconf settings/themes/keys:
SYSTEM_APPS='~/.rc/ubuntu-apps'
SYSTEM_CONF='~/.rc/ubuntu/ubuntu-gnome.dconf'


system_restore(){
  i $(cat SYSTEM_APPS | grep -oP "((?<=^)[^ ]*(?= -))"| tr '\n' ' ' );
  dconf load / < SYSTEM_CONF;

}

system_backup(){
  aptitude search '~i!~M' > SYSTEM_APPS;
  dconf dump / > SYSTEM_CONF;
}


#UBUNTU install
alias i='sudo apt-get install -y '
alias rem='sudo apt remove -y'

#UBUNTU upgrade
u(){
  sudo apt update;
  sudo apt dist-upgrade -y;
  sudo apt autoremove -y;
}

edit_repos(){
    sudo apt edit-sources;
}

#reboot
alias rs='sudo reboot'
# shut down
alias die='sudo shutdown -r now'
#stop asking for sudo password
alias become_god="sudo echo '$USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"


alias apt_list_installed="aptitude search '~i!~M'"

#process: find  / kill
alias p="sudo ps aux | grep "
alias pk="sudo killall -9 "

#PORTS: find  / kill
port(){
  lsof -i tcp:${1};
}
port_kill(){
  sudo lsof -t -i tcp:${1} | xargs kill -9
}


disk_space(){
  sudo du -cks * | sort -rn | head -11
}
disk_space_overall(){
  sudo du -cha --max-depth=1 / | grep -E "M|G";
}

chroot_mnt(){
  mount /dev/sda4 /mnt;
  cd /mnt;
  mount -t proc proc proc/;
  mount -t sysfs sys sys/;
  mount -o bind /dev dev/;
  chroot /mnt;
}


ipinfo(){
  #change to internet device
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
