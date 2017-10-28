
##SETUPS


setup_vim(){
  i neovim;
  git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime;
  sh ~/.vim_runtime/install_awesome_vimrc.sh;
}


setup_shell(){
  i silversearcher-ag ranger git;

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
}

setup_docker(){
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable";
  sudo apt-get update;
  sudo apt-get install -y docker-ce ;
  #i docker-compose #older version
}

setup_docker_compose(){

  sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose;
  sudo chmod +x /usr/local/bin/docker-compose;
  docker-compose --version;
}



setup_mongo(){
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
  echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
  sudo apt-get update
  sudo apt-get install -y mongodb-org-server
}

setup_node(){
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt-get install -y build-essential nodejs
}



setup_ajenti(){

  wget http://repo.ajenti.org/debian/key -O- | sudo apt-key add -;
  echo "deb http://repo.ajenti.org/ng/debian main main ubuntu" | sudo tee -a /etc/apt/sources.list;
  sudo apt-get update && i ajenti;
  sudo service ajenti restart;

}
