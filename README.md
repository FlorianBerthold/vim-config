# vim-config
Sub-Net .vimrc, no windows, gvim or neovim support.

# Pre Req.
Vim 7.3+, best with Vim 8.0+ and Truecolor Terminals.


On Debian
```
apt install -y vim-nox ranger universal-ctags
```


On OSX via Brew
```
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
brew install vim
```


# Install
This will delete you local vim config files and overwrites them
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/FlorianBerthold/vim-config/master/install.sh)"
```
