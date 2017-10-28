# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins-Overview

export ZSH=/home/alex/.oh-my-zsh
ENABLE_CORRECTION="false"
plugins=(
git-extras npm dirhistory common-aliases zsh-syntax-highlighting \
extract cp copyfile  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh



#source *.zsh
for rcfile in ~/.rc/zsh/**.zsh; do
  source $rcfile;
done
alias yf='node fuse'
