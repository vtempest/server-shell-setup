# SSH

#sync this local project to host home dir
sync(){
  rsync -azP -h --delete --exclude-from=.gitignore . ${1}:~
}

sshoist(){
  scp ~/.zshrc ${1}:~;
  ssh ${1};

}

#nginx
alias nx='sudo vi /etc/nginx/sites-enabled/default'
alias nxr='sudo service nginx restart'

https_enable(){
  sudo certbot --nginx --standalone --preferred-challenges http -d ${1}
}


#yarn
alias y='yarn'
alias yi='yarn install'
alias ya=" yarn add "
alias yag="yarn global add"
alias yad="yarn add --dev"
alias ys="yarn start"

# search
alias nis='npms search'
#kill all nodes
alias node_stop="sudo killall -9 node"
#allow node on port 80 w/o sudo
alias node_80="sudo setcap cap_net_bind_service=+ep /usr/bin/node"
