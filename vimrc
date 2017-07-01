"Mappings:
" Map - leader to space
let mapleader=' '
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" Linenumbers, toggle toggle toggle
nnoremap <silent> <F1> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" map global indent and fix the trailing whitespaces
noremap  <silent> <leader>i mzgg=G`z<CR>
noremap  <silent> <leader>r :retab<CR>
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <F7> :NERDTreeFind<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
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

""" Ablolish.vim      - Word variant manipulation, hard to explain
Plug 'https://github.com/tpope/tpope-vim-abolish'

""" Ctrl+P            - Fuzzy file, buffer, mru, tag, etc finder.
Plug 'https://github.com/kien/ctrlp.vim'
" dont change work dir, use the one where vim started
let g:ctrlp_working_path_mode = 0

""" Colorizer         - CSS Color highlighting
let g:colorizer_auto_filetype = 'css,html'

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
let g:gutentags_ctags_executable = 'ctags'
let g:gutentags_cache_dir = '~/.vim/tags'
"let g:gutentags_project_root = ['robots.txt']

""" Lion              - A simple alignment operator for Vim text editor
Plug 'https://github.com/tommcdo/vim-lion'
let g:lion_squeeze_spaces = 1

""" Molokai           - Color scheme for Vim
Plug 'https://github.com/tomasr/molokai'

""" Moonfly           - A dark color scheme for Vim
Plug 'https://github.com/bluz71/vim-moonfly-colors'

""" Moonfly-Statusbar - A simple statusline for Vim with moonfly colors
Plug 'https://github.com/bluz71/vim-moonfly-statusline'

""" Mucomplete        - Chained completion that works the way you want!
Plug 'https://github.com/lifepillar/vim-mucomplete'
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
      \ 'default' : ['path', 'ulti', 'omni', 'keyn', 'dict', 'uspl'],
      \ 'vim' : ['path', 'ulti', 'cmd', 'keyn']
      \ }
inoremap <expr> <C-E> mucomplete#popup_exit('<C-E>')
inoremap <expr> <C-Y> mucomplete#popup_exit('<C-Y>')
inoremap <expr> <CR> mucomplete#popup_exit('<CR>')
      \ . (pumvisible()
      \ && len(UltiSnips#SnippetsInCurrentScope())
      \ ? '<C-R>=UltiSnips#ExpandSnippet()<CR>'
      \ : '')

""" NERDTree          - A tree explorer plugin for vim.
Plug 'https://github.com/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let NERDTreeShowHidden=1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']

""" Salt              - Vim files for editing Salt files
Plug 'https://github.com/saltstack/salt-vim'

""" Sneak             - The missing motion for Vim
Plug 'https://github.com/justinmk/vim-sneak'

""" Snippets          - My Snippets
Plug 'https://github.com/FlorianBerthold/vim-snippets'

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
let g:tagbar_ctags_bin = 'uctags'

""" TTags             - Tag list browser for VIM
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

""" Whitespaces       - No description, website, or bullshit provided.
Plug 'https://github.com/720720/whitespace'
call plug#end()


" Backup / Swap / Undo-files:
" The double tailing slash will store files using full paths
" so if you edit two different models.py files
" you won't clobber your swap or backups.
silent !mkdir -p ~/.vim/backup
set backup
set backupdir=~/.vim/backup//
silent !mkdir -p ~/.vim/swap
set swapfile
set directory=~/.vim/swap//
" Write swap files after 5 seconds of inactivity.
set updatetime=5000
silent !mkdir -p ~/.vim/undo
set undofile
set undodir=~/.vim/undo//


" Colors:
" silent! colorscheme molokai
let g:gruvbox_contrast_dark='hard'
set background=dark
silent! colorscheme gruvbox
"silent! colorscheme moonfly


" Set:
set autoindent                 " Auto-indent new lines
set backspace=indent,eol,start " Allow backspace in insert mode
set display+=lastline
set encoding=utf-8             " Utf-8 as a minimum
set expandtab
set gcr=a:blinkon0             " Disable cursor blink
set history=1000               " Store lots of :cmdline history
set hlsearch                   " Highlight all search results
set ignorecase                 " Always case-insensitie
set incsearch                  " Searches for strings incrementally
set laststatus=2
set lazyredraw                 " avoid redrawing the screen mid-command.
set mouse=                     " In normal and visual mode
set nocompatible               " Stop behaving like vi
set number                     " Show line numbers
set numberwidth=1              " using only 1 column (and 1 ws) while possible
set ruler                      " Show row and column ruler information
set shiftwidth=2               " Number of auto-indent spaces
set showcmd                    " Show command in bottom bar
set showmatch                  " Highlight matching brace
set shortmess+=a               " Use [+]/[RO]/[w] for modified/readonly/written
set smartcase                  " Enable smart-case search
set smartindent                " Enable smart-indent
set smarttab                   " Enable smart-tabs
set splitright                 " New windows open to the right
set softtabstop=2              " Number of spaces per tab
set tabstop=2
set title                      " Turn on titlebar support
set t_ts=]1;
set t_fs=
set undolevels=1000            " Number of undo levels
set visualbell                 " Use visual bell (no beeping)
set virtualedit=block          " Let cursor move past the last char in <C-v>
set wildmenu
set wildmode=full
set wrap
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end


" Unicode Tab Test:
if &enc =~ '^u\(tf\|cs\)'   " When running in a Unicode environment,
  set list                  " visually represent certain invisible characters:
  let s:arr = nr2char(9655) " using U+25B7 (▷) for an arrow, and
  let s:dot = nr2char(8901) " using U+22C5 (⋅) for a very light dot,
  " display tabs as an arrow followed by some dots (▷⋅⋅⋅⋅⋅⋅⋅),
  exe "set listchars=tab:"    . s:arr . s:dot
  " and display trailing and non-breaking spaces as U+22C5 (⋅).
  exe "set listchars+=trail:" . s:dot
  exe "set listchars+=nbsp:"  . s:dot
  " Also show an arrow+space (↪ ) at the beginning of any wrapped long lines?
  " I don't like this, but I probably would if I didn't use line numbers.
  " let &sbr=nr2char(8618).' '
endif

" vim 7.3:
if v:version >= 800
  set belloff+=ctrlg             " If Vim beeps during completion
  set completeopt=menuone,preview,noinsert
  set termguicolors              " True colors support
  set ttyfast                    " Indicates a fast terminal connection.
endif

" vim: set fdm=expr fdl=-3 :
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
