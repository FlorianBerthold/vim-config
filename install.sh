#!/bin/sh

# aptitude install vim -y

# brew install shellcheck

# cleanup
rm ~/.vimrc
rm -rf ~/.vim

mkdir -p ~/.vim_backup

# basic colors
curl -fLo ~/.vim/colors/badwolf.vim --create-dirs \
   https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

curl -fLo ~/.vim/colors/molokai.vim --create-dirs \
  https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

# get the config
wget -qN https://raw.githubusercontent.com/FlorianBerthold/vim-config/master/vimrc -O ~/.vimrc

