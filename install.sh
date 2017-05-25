#!/bin/sh

# aptitude install vim -y

# brew install shellcheck



# cleanup
rm ~/.vimrc
rm -rf ~/.vim 

# plugin manager Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# basics
curl -fLo ~/.vim/colors/badwolf.vim --create-dirs \
   https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

# get the config
wget -qN https://raw.githubusercontent.com/FlorianBerthold/vim-config/master/.vimrc -O ~/.vimrc

