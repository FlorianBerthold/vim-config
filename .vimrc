augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" specify a directory for plugins (for neovim: ~/.local/share/nvim/plugged)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" a light and configurable statusline/tabline for vim
" https://github.com/itchyny/lightline.vim
"Plug 'itchyny/lightline.vim'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

"  Syntax checking hacks for vim
Plug 'vim-syntastic/syntastic'

" Improved nginx vim plugin (incl. syntax highlighting)
Plug 'chr4/nginx.vim'

call plug#end()

" colors
" https://github.com/joshdick/onedark.vim
syntax on
"colorscheme badwolf

colorscheme molokai


set history=1000 	 " store lots of :cmdline history
set undolevels=1000	 " number of undo levels

set backspace=indent,eol,start	" backspace behaviour

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

set laststatus=2

set backup
set backupdir=~/.vim_backup

" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" nerdtree
let NERDChristmasTree = 1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']
nmap <c-b> :NERDTreeToggle<cr>
nmap <C-n> <c-w><left><down><c-w><c-w>
nmap <C-p> <c-w><left><up><c-w><c-w>
nmap <C-o> <c-w><left><CR>

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
  let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='badwolf'

"""  Syntastic adjustments
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

