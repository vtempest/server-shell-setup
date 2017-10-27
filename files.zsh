


alias_add(){
  echo "alias ${1}='${2}'" >> ~/.zshrc ; source ~/.zshrc;
}



bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#combine cd+ls so when you cd then auto ls, folder also works w/o cd 
chpwd() ls  --color=always -h




alias f='ag --hidden --ignore .git -l -g "" | fzf -e -x --height=20% '

#find in files' content
alias ff='ag --hidden --nobreak --nonumbers --noheading . | fzf'

# alias ff='ag -g'
alias fd='ag -g'
# f(){ grep -RIs "$1" .; }
#find in files' names\
#find & replace in files' content
fr(){ find . -type f -exec sed -i "s/$1/$2/g" \{\} \; ;}

alias d='ranger '



alias rrm='sudo rm -rf '
alias r='rm -f -r --preserve-root '

#FILES
#own folder
own(){ sudo chmod 777 -R ${1:-.} && sudo chown -R ${USER} ${1:-.}; }
#list detailed
alias l='ls -la --color=always'
alias ll='ls -alh'
alias la='ls -A'

#back
alias ..='cd ..'



# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/alex/.fzf/shell/completion.zsh" 2> /dev/null

source "/home/alex/.fzf/shell/key-bindings.zsh"
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
