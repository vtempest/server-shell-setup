

setup_shell(){

  #add fish nvim to ubuntu PPA
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get update
  #common cli tools
  sudo apt-get install -y fish neovim  python3-pip \
    \ git  wget curl silversearcher-ag ranger; 


  # fish-plugins config
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
  omf install fzf nvm

  #fuzzy finder
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

  #node version manager
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash ; nvm install 19 \

  #clear default greeting
  sudo rm  /etc/motd; sudo rm -rf  /etc/update-motd.d; touch ~/.hushlogin; \  
    
  #nvim config
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim


}

# copy to  ~/.config/fish/config.fish


#optional setups

#prompt with icons
setup_prompt(){
  curl -sS https://starship.rs/install.sh | sh
  echo "starship init fish | source" >> ~/.config/fish/config.fish
}


setup_node(){
  sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  NODE_MAJOR=20
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  sudo apt-get update && sudo apt-get install nodejs -y

}
alias setup_docker="curl -fsSL https://test.docker.com -o test-docker.sh; sh test-docker.sh"


# ROOT SERVER SETUP first-time root setup of ssh user on aws
setup_root(){
  sudo useradd -m -G sudo user

  # allow ssh with password, which is disabled on amazon ec2 ubuntu
  sed -re 's/^(PasswordAuthentication)([[:space:]]+)no/\1\2yes/' -i.`date -I` /etc/ssh/sshd_config; 
  sudo service ssh restart;

  # sudo without asking password 
  echo "1. copy the line below, 2. sudo visudo 3. paste the line "\
    \ "below to end of the file opened\n"\
    \ "${USER} ALL=(ALL) NOPASSWD:ALL";
  sudo visudo
}


#common top command aliases
alias vim="nvim"
alias sync_with_remote_folder="rsync -azP -h --delete --exclude-from=.gitignore . " #user@host.com:~/folder
alias i="sudo apt install -y"
alias un="sudo apt remove -y"
alias apps="apt list --installed | cut -d "/" -f1 | sed -z 's/\n/ /g'"
alias list_installed="sudo apt install -y aptitude; aptitude search '~i!~M'"
alias diskspace="sudo du -cks * | sort -rn | head -11"
