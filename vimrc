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

" lean & mean status/tabline for vim that's light as air
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'https://github.com/kien/ctrlp.vim'

" Vim plugin that displays tags in a window, ordered by scope http://majutsushi.github.io/tagbar/
Plug 'https://github.com/majutsushi/tagbar'

" Molokai color scheme for Vim
Plug 'https://github.com/tomasr/molokai'

" a solid language pack for vim.
Plug 'https://github.com/sheerun/vim-polyglot'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'https://github.com/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"  Syntax checking hacks for vim
Plug 'https://github.com/vim-syntastic/syntastic'

" Improved nginx vim plugin (incl. syntax highlighting)
Plug 'https://github.com/chr4/nginx.vim'

" rainbow parentheses improved, shorter code, no level limit, smooth and fast, powerful configuration.
Plug 'https://github.com/luochen1990/rainbow'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'https://github.com/tpope/vim-fugitive'

" eunuch.vim: helpers for UNIX
Plug 'https://github.com/tpope/vim-eunuch'

" A simple alignment operator for Vim text editor
Plug 'https://github.com/tommcdo/vim-lion'

" commentary.vim: comment stuff out
Plug 'https://github.com/tpope/vim-commentary'

" surround.vim: quoting/parenthesizing made simple
Plug 'https://github.com/tpope/vim-surround'

""" Tags
" A Vim plugin that manages your tag files
Plug 'https://github.com/ludovicchabant/vim-gutentags'

""" Movement
" The missing motion for Vim 👟
Plug 'https://github.com/justinmk/vim-sneak'

""" Autocomplete and snippets combo
" Perform all your vim insert mode completions with Tab
"Plug 'https://github.com/ervandew/supertab'
" You don't Complete Me; Vim Completes Me! A super simple, super minimal, super light-weight tab completion plugin for Vim.
"Plug 'https://github.com/ajh17/VimCompletesMe'
" Chained completion that works the way you want!
Plug 'https://github.com/lifepillar/vim-mucomplete'
" UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
Plug 'https://github.com/SirVer/ultisnips'

""" Python
" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plug 'https://github.com/python-mode/python-mode'

""" Other
call plug#end()


""" keyboard mappings
" tagbar mappings
nmap <F8> :TagbarToggle<CR>
" nerdtree mappings
nmap <F7> :NERDTreeToggle<cr>
"nmap <C-n> <c-w><left><down><c-w><c-w>
"nmap <C-p> <c-w><left><up><c-w><c-w>
"nmap <C-o> <c-w><left><CR>


" mucomplete
set completeopt+=menuone
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

""" colors
" https://github.com/joshdick/onedark.vim
syntax on
silent! colorscheme molokai

" taste the rainbow
let g:rainbow_active = 1

set autoindent		        " auto-indent new lines
set autoread                    " autoload file changes. you can undo by pressing u.
set backspace=indent,eol,start	" backspace behaviour
"set complete-=i
set copyindent
set display+=lastline
set encoding=utf-8
set gcr=a:blinkon0	        " disable cursor blink
set history=1000 	        " store lots of :cmdline history
set hlsearch		        " highlight all search results
set ignorecase		        " always case-insensitive
set incsearch		        " searches for strings incrementally
set laststatus=2
set nrformats-=octal
set number		        " show line numbers
set ruler		        " show row and column ruler information
set shiftwidth=2	        " number of auto-indent spaces
set showcmd                     " show command in bottom bar
set showmatch		        " highlight matching brace
set smartcase		        " enable smart-case search
set smartindent		        " enable smart-indent
set smarttab		        " enable smart-tabs
set softtabstop=2	        " number of spaces per tab
set tabpagemax=50
set undolevels=1000	        " number of undo levels
set visualbell		        " use visual bell (no beeping)
set wildmenu

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" nerdtree
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']

" lion save some space
let b:lion_squeeze_spaces = 1

" Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

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

" vim:set ft=vim et sw=2:
