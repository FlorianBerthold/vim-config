augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Install the plugin manager
" specify a directory for plugins (for neovim: ~/.local/share/nvim/plugged)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" The double tailing slash will store files using full paths so if you edit two different models.py files you won't clobber your swap or backups.
" backupfiles
if empty(glob('~/.vim/backup'))
  silent !mkdir -p ~/.vim/backup
endif

set backup
set backupdir=~/.vim/backup//

" swapfiles
if empty(glob('~/.vim/swap'))
  silent !mkdir -p ~/.vim/swap
endif

set swapfile
set directory=~/.vim/swap//

" install the plugins
call plug#begin('~/.vim/plugged')

" a light and configurable statusline/tabline for vim
" https://github.com/itchyny/lightline.vim
"Plug 'itchyny/lightline.vim'

" lean & mean status/tabline for vim that's light as air
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
" https://github.com/vim-airline/vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

" Perform all your vim insert mode completions with Tab
" Plug 'ervandew/supertab'

" You don't Complete Me; Vim Completes Me! A super simple, super minimal, super light-weight tab completion plugin for Vim.
" https://github.com/ajh17/VimCompletesMe
" Plug 'ajh17/VimCompletesMe'

" Fuzzy file, buffer, mru, tag, etc finder.
" https://github.com/kien/ctrlp.vim
Plug 'kien/ctrlp.vim'

" Vim plugin that displays tags in a window, ordered by scope http://majutsushi.github.io/tagbar/
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'

" Molokai color scheme for Vim
" https://github.com/tomasr/molokai
Plug 'tomasr/molokai'

" a solid language pack for vim.
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Vim plugin for intensely orgasmic commenting
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

"  Syntax checking hacks for vim
" https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

" Improved nginx vim plugin (incl. syntax highlighting)
" https://github.com/chr4/nginx.vim
Plug 'chr4/nginx.vim'

" rainbow parentheses improved, shorter code, no level limit, smooth and fast, powerful configuration.
" https://github.com/luochen1990/rainbow
Plug 'luochen1990/rainbow'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

""" Python
" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
" https://github.com/python-mode/python-mode
Plug 'klen/python-mode'

call plug#end()


""" keyboard mappings
" tagbar mappings
nmap <F8> :TagbarToggle<CR>
" nerdtree mappings
nmap <F7> :NERDTreeToggle<cr>
"nmap <C-n> <c-w><left><down><c-w><c-w>
"nmap <C-p> <c-w><left><up><c-w><c-w>
"nmap <C-o> <c-w><left><CR>


""" colors
" https://github.com/joshdick/onedark.vim
syntax on
"colorscheme badwolf
silent! colorscheme molokai

" taste the rainbow
let g:rainbow_active = 1

set history=1000 	 " store lots of :cmdline history
set undolevels=1000	 " number of undo levels
set tabpagemax=50

set encoding=utf-8

set backspace=indent,eol,start	" backspace behaviour
set complete-=i
set gcr=a:blinkon0	"disable cursor blink

set number		" show line numbers
set showcmd             " show command in bottom bar
set showmatch		" highlight matching brace
set visualbell		" use visual bell (no beeping)
set hlsearch		" highlight all search results
set smartcase		" enable smart-case search
set ignorecase		" always case-insensitive
set incsearch		" searches for strings incrementally

set autoindent		" auto-indent new lines
set copyindent

set shiftwidth=2	" number of auto-indent spaces
set softtabstop=2	" number of spaces per tab
set smartindent		" enable smart-indent
set smarttab		" enable smart-tabs

set ruler		" show row and column ruler information
set wildmenu
set laststatus=2

set autoread

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline


set nrformats-=octal

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" nerdtree
let NERDChristmasTree = 1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='badwolf'

" Syntastic adjustments
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "S"
let g:syntastic_style_warning_symbol = "s"
highlight SyntasticStyleWarning term=reverse cterm=bold ctermfg=244 ctermbg=232 gui=bold guifg=#808080 guibg=#080808
highlight SyntasticStyleError term=reverse ctermbg=235 guibg=#403D3D
highlight SyntasticWarningSign ctermfg=208 gui=italic guifg=#FD971F
highlight SyntasticStyleWarningSign ctermfg=11 guifg=Yellow ctermbg=236 guibg=#232526
highlight SyntasticStyleErrorSign term=bold ctermfg=11 gui=bold guifg=Yellow


""" snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim:set ft=vim et sw=2:
