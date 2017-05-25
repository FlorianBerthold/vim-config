#!/bin/sh

aptitude install vim -y

mkdir -p ~/.vim/colors
# mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/autoload/airline/themes

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	

# colors
wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim -O ~/.vim/colors/onedark.vim
wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim -O ~/.vim/autoload/onedark.vim
wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/lightline/colorscheme/onedark.vim -O ~/.vim/autoload/lightline/colorscheme/onedark.vim


# get the config
wget https://raw.githubusercontent.com/FlorianBerthold/vim-config/master/.vimrc -O ~/.vimrc


