#PATH

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

# ZSH
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

export ZSH=/home/alex/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
ENABLE_CORRECTION="true"
plugins=(git)

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
alias zx='subl ~/.zshrc'
# .bashrc prompt alternative
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '




#FILES
#unarchive
x(){ case $1 in *.tar.bz2) tar xjf $1;; *.tar.gz) tar xzf $1;; *.bz2) bunzip2 $1;; *.rar) rar x $1;; *.gz) gunzip $1;; *.tar) tar xf $1;; *.tbz2) tar xjf $1;; *.tgz) tar xzf $1;; *.zip) unzip $1;; *.Z) uncompress $1;; esac; }
#own folder
own(){ sudo chmod 777 -R ${1:-.} && sudo chown -R ${USER} ${1:-.}; }
#list detailed
alias l='ls -la --color=always'
alias ll='ls -alh'
alias la='ls -A'
#back
alias ..='cd ..'


#SEARCH
#find in files' content
f(){ grep -RIs "$1" .; }
#find in files' names
ff(){ sudo ls -R | grep "$1"; }
#find & replace in files' content
fr(){ find . -type f -exec sed -i "s/$1/$2/g" \{\} \; ;}


#PROCESS
#find process
p(){ ps aux | grep $1 | grep -v grep; }
#kill process
pk(){ sudo killall -9 $1 ;}
#repeat command
loop(){ watch -n 1 $1 ; }
#top sorted by cpu
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"


#SYSTEMS (edit)
#ARCH install
# alias i="pacaur --noedit --noconfirm --needed -S"%
#UBUNTU upgrade
alias u='sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y'
#UBUNTU install
alias i='sudo apt-get install -y '
#reboot
alias r='sudo reboot'
# shut down
alias die='sudo shutdown -r -n now'
#stop asking for sudo password
alias become_sudo="sudo echo '$USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"
#VIRTUALBOX - enables ssh into vbox
vbox_ssh_open(){ VBoxManage modifyvm $1 --natpf1 "ssh,tcp,,3022,,22" ;}
vbox_ssh(){ ssh -p 3022 127.0.0.1 ;}


#GIT
#git force commit
gg(){ git add . ; git commit -a -m $1 ; git push -u -f origin master ; }
#push master
gp(){ git push -u -f origin master ; }
#generate this hosts git key
git_key(){ ssh-keygen -t rsa -C "$1" ; cat ~/.ssh/id_rsa.pub; }
#undo last commit
alias git_undo="git reset --hard HEAD~1"
#delete branch by name
git_del_branch(){ git push origin --delete $1 ;  git branch -d $1 ; }
#forgot to add msg to commit
git_add_msg(){ git commit --amend -m "$1" ; }
#removes file from tracking
git_rm(){ git rm --cached $1 ;}
#discard local changes
git_discard(){ git stash save --keep-index; }
#pull overwriting local files and commits
git_pull_hard(){ git fetch --all; git reset --hard origin/master; }
#purges file from history
git_purge(){ git filter-branch --prune-empty -d /dev/shm/scratch --index-filter "git rm --cached -f --ignore-unmatch $1" --tag-name-filter cat -- --all ;}


# NODE NPM (edit)
#start server with log and reboot-on-change with npm forever
alias npm_start="nohup forever --minUptime=10 --spinSleepTime=2000 -e ~/server.log -o ~/server.log -a -v -w . >/dev/null 2>&1 &"
#kill all nodes
alias npm_stop="sudo killall -9 node nodejs"
#allow node on port 80 w/o sudo
alias npm_node_on_80="sudo setcap cap_net_bind_service=+ep `readlink -f \\`which node\\``"
#start mongo in db/
alias mongo_start="rm -f db/mongod.lock && nohup mongod --dbpath=db  --smallfiles --nojournal --quiet >> ~/mongo.log 2>&1 & "
