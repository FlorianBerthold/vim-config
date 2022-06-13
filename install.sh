#!/bin/sh

# aptitude install vim -y

# brew install shellcheck

# cleanup
rm -rf ~/.vimrc
rm -rf ~/.vim

# get the config
wget -qN https://raw.githubusercontent.com/FlorianBerthold/vim-config/master/vimrc -O ~/.vimrc

