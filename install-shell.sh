#!/bin/bash

# setup shell with best dev tools on Ubuntu
# fish, nushell, nvim, helix, node, bun, pacstall, docker

# sudo passwd ${USER} # set password for user
setup_shell(){

  #add fish nvim helix to ubuntu PPA
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo add-apt-repository ppa:maveonair/helix-editor
  sudo apt update

  sudo apt install -y fish neovim  git wget curl helix 


  #bun 
  curl -fsSL https://bun.sh/install | bash

  #node with volta
  curl https://get.volta.sh | bash
  source ~/.bashrc
  volta install node

  #install nushell
  npm i -g pnpm nushell

  #nvim config
  git clone https://github.com/LazyVim/starter ~/.config/nvim 


  #starship prompt -- needs manual setup
  sudo sh -c "$(curl -sS https://starship.rs/install.sh )"

  #install prompt into nu shell
  echo "mkdir ~/.cache/starship; starship init nu | save -f ~/.cache/starship/init.nu" >> /home/$USER/.config/nushell/env.nu
  echo "use ~/.cache/starship/init.nu" >> /home/$USER/.config/nushell/config.nu
  
  #install prompt into fish shell
  echo "starship init fish | source" >> ~/.config/fish/config.fish

  #pacstall - discover 3rd party deb packages
  sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install || wget -q https://pacstall.dev/q/install -O -)"

   #install greeting
  sudo wget https://raw.githubusercontent.com/vtempest/server-shell-setup/refs/heads/master/systeminfo.sh -O ~/.config/systeminfo.sh
  sudo chmod +x ~/.config/systeminfo.sh
  sudo echo "bash ~/.config/systeminfo.sh" >> ~/.bashrc
  sudo echo "bash ~/.config/systeminfo.sh" >> ~/.config/fish/config.fish

  #clear default greeting
  fish -c "set -U fish_greeting \"\""
  sudo rm -f  /etc/motd; sudo rm -rf  /etc/update-motd.d; touch ~/.hushlogin; 


  # fish plugins config - goes into fish
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
  fish -c "omf install fzf nvm"
  bash

}


#setup_docker
setup_docker(){
  curl -fsSL https://test.docker.com -o test-docker.sh; 
  sh test-docker.sh;
  sudo apt-get install -y uidmap;
  dockerd-rootless-setuptool.sh install;
}

# first-time setup of root ssh user 
setup_root(){

  # allow ssh with password, which is disabled on aws ec2 ubuntu
  sed -re 's/^(PasswordAuthentication)([[:space:]]+)no/\1\2yes/' -i.date -I /etc/ssh/sshd_config; 
  sudo service ssh restart;

  # sudo without asking password 
  echo "1. copy the line below, 2. sudo visudo 3. paste the line "\
    \ "below to end of the file opened\n"\
    \ "${USER} ALL=(ALL) NOPASSWD:ALL";
}


#run main 
setup_shell

setup_docker