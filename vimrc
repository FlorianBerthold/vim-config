" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

" Auto reload vimrc on save{{{
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }}}}

" Install the plugin manager{{{
" specify a directory for plugins (for neovim: ~/.local/share/nvim/plugged)
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"}}}

" Backup / Swap and Undofiles " {{{
" The double tailing slash will store files using full paths so if you edit two different models.py files you won't clobber your swap or backups.
if !isdirectory(expand('~').'/.vim/backup')
	silent !mkdir -p ~/.vim/backup
endif
set backup
set backupdir=~/.vim/backup//

" swapfiles
if !isdirectory(expand('~').'/.vim/swap')
	silent !mkdir -p ~/.vim/swap
endif
set swapfile
set directory=~/.vim/swap//

" undo
if !isdirectory(expand('~').'/.vim/undo')
	silent !mkdir -p ~/.vim/undo
endif
set undofile
set undodir=~/.vim/undo//
" }}}

" Install the plugins and config them {{{
" https://github.com/junegunn/vim-plug/wiki/faq
call plug#begin('~/.vim/plugged')

" Color etc {{{
" Molokai color scheme for Vim
Plug 'https://github.com/tomasr/molokai'

" lean & mean status/tabline for vim that's light as air
Plug 'https://github.com/vim-airline/vim-airline' "
Plug 'https://github.com/vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='badwolf'

" rainbow parentheses improved, shorter code, no level limit, smooth and fast, powerful configuration.
Plug 'https://github.com/luochen1990/rainbow'
let g:rainbow_active = 1
"}}}

""" Finding file
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'https://github.com/kien/ctrlp.vim'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'https://github.com/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']

" everything else
" Vim plugin that displays tags in a window, ordered by scope http://majutsushi.github.io/tagbar/
Plug 'https://github.com/majutsushi/tagbar'

Plug 'https://github.com/vim-syntastic/syntastic' "{{{
"  Syntax checking hacks for vim
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
"}}}

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'https://github.com/tpope/vim-fugitive'

" eunuch.vim: helpers for UNIX
Plug 'https://github.com/tpope/vim-eunuch'

" A simple alignment operator for Vim text editor
Plug 'https://github.com/tommcdo/vim-lion'
let b:lion_squeeze_spaces = 1

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
map f <Plug>Sneak_s
map F <Plug>Sneak_S

""" Autocomplete and snippets combo
" You don't Complete Me; Vim Completes Me! A super simple, super minimal, super light-weight tab completion plugin for Vim.
"Plug 'https://github.com/ajh17/VimCompletesMe'
" Chained completion that works the way you want!
Plug 'https://github.com/lifepillar/vim-mucomplete'
set completeopt-=preview
set completeopt+=longest,menuone,noinsert,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

" UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
Plug 'https://github.com/SirVer/ultisnips'
" vim-snipmate default snippets (Previously snipmate-snippets)
Plug 'https://github.com/honza/vim-snippets'

""" Python
" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plug 'https://github.com/python-mode/python-mode'

""" Other
" Improved nginx vim plugin (incl. syntax highlighting)
Plug 'https://github.com/chr4/nginx.vim'

" a solid language pack for vim.
Plug 'https://github.com/sheerun/vim-polyglot'

call plug#end()
"}}}

" Enable colors and select theme
syntax on
silent! colorscheme molokai

" Wildmode / Tab compl. {{{
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gifzo
"}}}

"  Autocomplete with TAB when typing words {{{
"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"
" }}}


set autoindent		              " auto-indent new lines
set autoread                    " autoload file changes. you can undo by pressing u.
set backspace=indent,eol,start	" allow backspace in insert mode
set copyindent
set display+=lastline
set encoding=utf-8
set gcr=a:blinkon0	            " disable cursor blink
set history=1000 	              " store lots of :cmdline history
set hlsearch		                " highlight all search results
set ignorecase		              " always case-insensitive
set incsearch		                " searches for strings incrementally
set laststatus=2
set nrformats-=octal
set number		                  " show line numbers
set ruler		                    " show row and column ruler information
set shiftwidth=2	              " number of auto-indent spaces
set showcmd                     " show command in bottom bar
set showmatch		                " highlight matching brace
set smartcase		                " enable smart-case search
set smartindent		              " enable smart-indent
set smarttab		                " enable smart-tabs
set softtabstop=2	              " number of spaces per tab
set tabpagemax=50
set undolevels=1000	            " number of undo levels
set visualbell		              " use visual bell (no beeping)

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

