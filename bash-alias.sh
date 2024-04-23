
# | Command | Description |
# | --- | --- |
# |setup_sudo | use sudo without password|
# |setup_ssh | enable pubkey/pw login|
# |setup_docker | sets up docker-compose script|
# |setup_git | setup commits and ssh key to github.com|
# |sync_with_remote_folder | sync local with remote using [command] user@host.com:~/folder|
# |i | apt install, type word then TAB to search in all available|
# |un | apt uninstall|
# |list_installed | list installed packages |
# |diskspace |  disk % filled|
# |process_find | find process name containing [search]|
# |process_kill | kill process [number]|
# |port_find | list process running on port [number]|
# |port_kill | kill process running on port [number] |



#common top command aliases
alias vim="nvim"

alias sync_with_remote="rsync -azP -h --delete --exclude-from=.gitignore . " #user@host.com:~/folder
alias i="sudo apt install -y"
alias un="sudo apt remove -y"
alias apps_names="apt list --installed | cut -d "/" -f1 | sed -z 's/\n/ /g'"
alias apps_desc="sudo apt install -y aptitude; aptitude search '~i!~M'"

#sort ducks in a row by head
alias diskspace="sudo du -cks * | sort -rn | head -11"


alias f='ag --hidden --ignore .git -l -g "" | fzf -e -x --height=20% '

#find in files' content
alias ff='ag --hidden --nobreak --nonumbers --noheading . | fzf'

#find in files' names\
#find & replace in files' content
fr(){ find . -type f -exec sed -i "s/$1/$2/g" \{\} \; ;}

#own folder
own(){ sudo chmod 777 -R ${1:-.} && sudo chown -R ${USER} ${1:-.}; }
#list detailed
alias l='ls -la --color=always'
alias ll='ls -alh'



#UBUNTU install
alias i='sudo apt-get install -y '
alias rem='sudo apt remove -y'

#UBUNTU upgrade
up(){
  sudo apt update;
  sudo apt dist-upgrade -y;
  sudo apt autoremove -y;
}

edit_repos(){
    sudo apt edit-sources;
}

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
