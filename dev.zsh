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


# NODE
alias nis='npms search '

#installers
alias ni=" yarn add "
alias nig="yarn global add"
alias nid="yarn add --dev"
#start
alias n="yarn start"

#kill all nodes
alias npm_stop="sudo killall -9 node && sudo killall -9 nodejs"
#allow node on port 80 w/o sudo
alias npm_node_on_80="sudo setcap cap_net_bind_service=+ep /usr/bin/node"

alias npm_allow_global='sudo chmod 777 /usr/bin'
