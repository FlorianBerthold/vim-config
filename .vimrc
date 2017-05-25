# Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')


# A light and configurable statusline/tabline for Vim 
Plug 'itchyny/lightline.vim'

# A solid language pack for Vim. 
Plug 'sheerun/vim-polyglot'

# Colors
# https://github.com/joshdick/onedark.vim
syntax on
colorscheme onedark
# Show line numbers

set number	
# Highlight matching brace
set showmatch	

# Use visual bell (no beeping)
set visualbell	

# Highlight all search results
set hlsearch	

# Enable smart-case search
set smartcase	

# Always case-insensitive
set ignorecase	

# Searches for strings incrementally
set incsearch	

# Auto-indent new lines
set autoindent	

# Number of auto-indent spaces
set shiftwidth=2	

# Enable smart-indent
set smartindent	

# Enable smart-tabs
set smarttab	

# Number of spaces per Tab
set softtabstop=2	

## Advanced
# Show row and column ruler information
set ruler	
 
 # Number of undo levels
set undolevels=1000	

# Backspace behaviour
set backspace=indent,eol,start	