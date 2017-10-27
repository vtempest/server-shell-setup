
alias ai='apm install '
alias a='${EDITOR} '
alias s='subl'


docker_drown(){
  docker ps | awk {' print $1 '} | tail -n+2 > tmp.txt; for line in $(cat tmp.txt); do docker kill $line; done; rm tmp.txt;
}

docker_autostart_disable(){

  docker ps | awk {' print $1 '} | tail -n+2 > tmp.txt; for line in $(cat tmp.txt); do docker update --restart=no  $line; done; rm tmp.txt;

}


#EDITOR
export EDITOR='atom'

alias e='${EDITOR}'
alias ,='${EDITOR} ~/.rc'


#VIRTUALBOX - enables ssh into vbox
vbox_ssh_open(){ VBoxManage modifyvm $1 --natpf1 "ssh,tcp,,3022,,22" ;}
vbox_ssh(){ ssh -p 3022 127.0.0.1 ;}
