" specify a directory for plugins (for neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" a light and configurable statusline/tabline for vim
" https://github.com/itchyny/lightline.vim
"Plug 'itchyny/lightline.vim'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Fuzzy file, buffer, mru, tag, etc finder.
" https://github.com/kien/ctrlp.vim
Plug 'kien/ctrlp.vim'

" a solid language pack for vim.
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Vim plugin for intensely orgasmic commenting
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

call plug#end()


" colors
" https://github.com/joshdick/onedark.vim
syntax on
colorscheme onedark


set history=1000 		 " store lots of :cmdline history
set undolevels=1000	 " number of undo levels

set backspace=indent,eol,start	" backspace behaviour

set gcr=a:blinkon0	"disable cursor blink

set number				" show line numbers
set showcmd             " show command in bottom bar
set showmatch			" highlight matching brace
set visualbell				" use visual bell (no beeping)
set hlsearch				" highlight all search results
set smartcase			" enable smart-case search
set ignorecase			" always case-insensitive
set incsearch				" searches for strings incrementally
set autoindent			" auto-indent new lines


set shiftwidth=2		" number of auto-indent spaces
set softtabstop=2		" number of spaces per tab
set smartindent			" enable smart-indent
set smarttab				" enable smart-tabs

"" advanced

set ruler					" show row and column ruler information

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ }
      \ }
