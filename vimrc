" vim: set fdm=expr fdl=-3 :
:set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

" Mappings:
" Map - leader to space
let mapleader=" "
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" Linenumbers, toggle toggle toggle
nnoremap <silent> <F1> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" map global indent and fix the trailing whitespaces
noremap  <silent> <F2> mzgg=G`z <bar> :FixWhitespace <CR>
" fold selector
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <F7> :NERDTreeFind<CR>
nnoremap <F8> :TagbarToggle<CR>

" Auto reload vimrc on save
" augroup reload_vimrc " {
" 	autocmd!
" 	autocmd BufWritePost $MYVIMRC source $MYVIMRC
" augroup END
"
" Yank selectors
vnoremap // y/<C-R>\"\"\"<CR>

" Plugins:
" https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

""" Ablolish.vim      - Word variant manipulation... hard to explain, check the link.
Plug 'https://github.com/tpope/tpope-vim-abolish'

""" AirLine           - Lean & mean status/tabline for vim that's light as air
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = -1
let g:airline_theme='badwolf'

""" Ctrl+P            - Fuzzy file, buffer, mru, tag, etc finder.
Plug 'https://github.com/kien/ctrlp.vim'
" dont change work dir, use the one where vim started
let g:ctrlp_working_path_mode = 0

""" Commentary.vim    - Comment stuff out
Plug 'https://github.com/tpope/vim-commentary'

""" Eunuch.vim        - Helpers for UNIX
Plug 'https://github.com/tpope/vim-eunuch'

""" Fugitive.vim      - The Git wrapper so awesome, it should be illegal
Plug 'https://github.com/tpope/vim-fugitive'

""" Gruvbox           - Retro groove color scheme for Vim
Plug 'https://github.com/morhetz/gruvbox'

""" Gutentags         - A Vim plugin that manages your tag files
Plug 'https://github.com/ludovicchabant/vim-gutentags'

""" Lion              - A simple alignment operator for Vim text editor
Plug 'https://github.com/tommcdo/vim-lion'
let g:lion_squeeze_spaces = 1

""" Molokai           - Color scheme for Vim
Plug 'https://github.com/tomasr/molokai'

""" Mucomplete        - Chained completion that works the way you want!
Plug 'https://github.com/lifepillar/vim-mucomplete'
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
			\ 'default' : ['path', 'ulti', 'omni', 'keyn', 'dict', 'uspl'],
			\ 'vim'     : ['path', 'cmd', 'keyn']
			\ }
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

""" NERDTree          - A tree explorer plugin for vim.
Plug 'https://github.com/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let NERDTreeShowHidden=1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']

""" Salt              - Vim files for editing Salt files
Plug 'https://github.com/saltstack/salt-vim'

""" Sneak             - The missing motion for Vim 👟
Plug 'https://github.com/justinmk/vim-sneak'

""" Surround.vim      - Quoting/parenthesizing made simple
Plug 'https://github.com/tpope/vim-surround'

""" Syntastic         - Syntax checking hacks for vim
Plug 'https://github.com/vim-syntastic/syntastic'
" from :h syntastic-csh
let g:syntastic_shell = "/bin/sh"
let g:syntastic_check_on_open        = 0
let g:syntastic_check_on_wq          = 0
let g:syntastic_error_symbol         = "✗"
let g:syntastic_warning_symbol       = "⚠"
let g:syntastic_style_error_symbol   = "S"
let g:syntastic_style_warning_symbol = "s"
highlight SyntasticStyleWarning      term=reverse cterm=bold   ctermfg=244 ctermbg=232 gui=bold guifg=#808080 guibg=#080808
highlight SyntasticStyleError        term=reverse ctermbg=235  guibg=#403D3D
highlight SyntasticWarningSign       ctermfg=208  gui=italic   guifg=#FD971F
highlight SyntasticStyleWarningSign  ctermfg=11   guifg=Yellow ctermbg=236 guibg=#232526
highlight SyntasticStyleErrorSign    term=bold    ctermfg=11   gui=bold    guifg=Yellow

""" Tagbar            - Vim plugin that displays tags in a window
Plug 'https://github.com/majutsushi/tagbar'

""" TTags             - Tag list browser for VIM (List, filter, preview, jump to tags)
Plug 'https://github.com/tomtom/ttags_vim'

""" Python-mode       - PyLint, Rope, Pydoc, breakpoints from box.
Plug 'https://github.com/python-mode/python-mode'

""" Polyglot          - A solid language pack for vim.
Plug 'https://github.com/sheerun/vim-polyglot'

""" Repeat.vim        - enable repeating supported plugin maps with
Plug 'https://github.com/tpope/vim-repeat'

""" UltiSnips         - The ultimate snippet solution for Vim.
Plug 'https://github.com/SirVer/ultisnips'

""" Unimpaired.vim    - pairs of handy bracket mappings
Plug 'https://github.com/tpope/vim-unimpaired'

""" Undotree          - The ultimate undo history visualizer for VIM
Plug 'https://github.com/mbbill/undotree'
nnoremap <F5> :UndotreeToggle<cr>

""" Whitespaces       - Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'https://github.com/bronson/vim-trailing-whitespace'
call plug#end()

" Colors:
syntax on
" silent! colorscheme molokai
let g:gruvbox_contrast_dark='hard'
set background=dark
silent! colorscheme gruvbox


" Backup / Swap / Undo-files:
" The double tailing slash will store files using full paths so if you edit two different models.py files you won't clobber your swap or backups.
silent !mkdir -p ~/.vim/backup
set backup
set backupdir=~/.vim/backup//
silent !mkdir -p ~/.vim/swap
set swapfile
set directory=~/.vim/swap//
silent !mkdir -p ~/.vim/undo
set undofile
set undodir=~/.vim/undo//

" Settings:
set autoindent                   " auto-indent new lines
set autoread                     " autoload file changes. you can undo by pressing u.
set backspace=indent,eol,start	 " allow backspace in insert mode
set display+=lastline
set encoding=utf-8               " utf-8 as a minimum
set gcr=a:blinkon0	             " disable cursor blink
set history=1000 	               " store lots of :cmdline history
set hlsearch		                 " highlight all search results
set ignorecase		               " always case-insensitive
set incsearch		                 " searches for strings incrementally
set laststatus=2
set lazyredraw                   " redraw only when we need to
set mouse=                       " i dont want a mouse
set number		                   " show line numbers
set ruler		                     " show row and column ruler information
set shiftwidth=2	               " number of auto-indent spaces
set showcmd                      " show command in bottom bar
set showmatch		                 " highlight matching brace
set smartcase		                 " enable smart-case search
set smartindent		               " enable smart-indent
set smarttab		                 " enable smart-tabs
set softtabstop=2	               " number of spaces per tab
set tabstop=2
set undolevels=1000	             " number of undo levels
set visualbell		               " use visual bell (no beeping)
" set the mouse
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end


" For vim 7.3:
if v:version >= 800
	set belloff+=ctrlg             " If Vim beeps during completion
	set completeopt=menuone,preview,noinsert
	set termguicolors						   " true colors support
endif

" FoldText
set foldtext=FoldText()
function! FoldText()
	let l:lpadding = &fdc
	redir => l:signs
	execute 'silent sign place buffer='.bufnr('%')
	redir End
	let l:lpadding += l:signs =~ 'id=' ? 2 : 0
	if exists("+relativenumber")
		if (&number)
			let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
		elseif (&relativenumber)
			let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
		endif
	else
		if (&number)
			let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
		endif
	endif
	let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
	let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')
	let l:info = ' (' . (v:foldend - v:foldstart) . ')'
	let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
	let l:width = winwidth(0) - l:lpadding - l:infolen
	let l:separator = ' … '
	let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
	let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
	let l:text = l:start . ' … ' . l:end
	return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
endfunction
