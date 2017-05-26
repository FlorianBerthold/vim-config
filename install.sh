#!/bin/sh

# aptitude install vim -y

# brew install shellcheck

# cleanup
rm ~/.vimrc
rm -rf ~/.vim

mkdir -p ~/.vim_backup

# get the config
wget -qN https://raw.githubusercontent.com/FlorianBerthold/vim-config/master/vimrc -O ~/.vimrc

