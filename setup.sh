#!/bin/bash

# desktop only: install terminal from https://hyper.is/#installation
# wget https://releases.hyper.is/download/AppImage
#
# Ubuntu Gnome dconf settings/themes/keys: 
# dconf load / < ubuntu-gnome.conf


#install zsh
sudo apt install -y zsh;
chsh -s /bin/zsh

#install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#install unix tools
sudo apt install  -y silversearcher-ag ranger git fonts-roboto;
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

#backup
cd ~ && mv .zshrc .zshrc.old && mv .hyper.js .hyper.js.old

#overwrite rc
ln -s ~/.rc/.zshrc ~/.zshrc
ln -s ~/.rc/.hyper.js ~/.hyper.js
