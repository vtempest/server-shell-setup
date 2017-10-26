# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins-Overview

export ZSH=/home/alex/.oh-my-zsh
ENABLE_CORRECTION="false"
plugins=(
git-extras npm dirhistory common-aliases zsh-syntax-highlighting \
extract cp copyfile
)

source $ZSH/oh-my-zsh.sh


#source *.zsh
for rcfile in ~/.rc/**.zsh; do
  source $rcfile;
done
