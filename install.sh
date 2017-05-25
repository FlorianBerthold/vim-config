#!/bin/sh

# aptitude install vim -y

# cleanup
rm -rf ~/.vim 

# make the dirs we need
mkdir -p ~/.vim/colors
#mkdir -p ~/.vim/autoload
#mkdir -p ~/.vim/autoload/lightline/colorscheme
mkdir -p ~/.vim/autoload/airline/themes


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	

# colors
wget -qN https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim -O ~/.vim/colors/onedark.vim
wget -qN https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim -O ~/.vim/autoload/onedark.vim
wget -qN https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/airline/themes/onedark.vim -O ~/.vim/airline/themes/onedark.vim
#wget -qN https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/lightline/colorscheme/onedark.vim -O ~/.vim/autoload/lightline/colorscheme/onedark.vim

# get the config
wget -qN https://raw.githubusercontent.com/FlorianBerthold/vim-config/master/.vimrc -O ~/.vimrc


