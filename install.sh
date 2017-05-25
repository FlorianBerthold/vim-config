#!/bin/sh

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
wget https://raw.github.com/joshdick/onedark.vim/blob/master/autoload/onedark.vim -O ~/.vim/autoload/onedark.vim
wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/airline/themes/onedark.vim -O ~/.vim/autoload/airline/themes/onedark.vim


# get the config
wget https://raw.githubusercontent.com/FlorianBerthold/vim-config/.vimrc -O ~/.vimrc