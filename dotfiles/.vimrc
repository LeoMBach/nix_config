" Set default encoding to UTF-8
set encoding=utf8

" Add current dir to path for fuzzy finding
set path +=**

" Use the mouse in all modes
set mouse=a

" Show line numbers
set number
set numberwidth=2

" Enable syntax highlighting
syntax enable

" Show <row,col> display at all times
set ruler

" Show the last command in the bottom right corner
set showcmd

" Highlight the row the cursor is on
set cursorline

" Show the status line at all times
set laststatus=2

" Highlight matching braces
set showmatch

" Only redraw when necessary
set lazyredraw

" Search as characters are entered and highlight matches
set incsearch
set hlsearch

" Ignore case when searching, but try to be smart about it
set ignorecase
set smartcase

" Configure tabs to be 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Configure tabs to be 2 spaces for particular filetypes
autocmd FileType html       :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType yaml       :setlocal sw=2 ts=2 sts=2

" Set backspace to work like in most applications
set backspace=eol,start,indent

" Enable filetype plugins and indent settings
filetype plugin on
filetype indent on

" Show visual autocomplete for command menu
set wildmenu

" Enable folding and configure it
set foldenable
set foldlevelstart=10
set foldnestmax=10 " God help me if I ever hit this number
set foldmethod=indent

" Stop error bell
set noerrorbells
set novisualbell

" Stop backup and swap files from being created
set nobackup

" Set leader key to comma
let mapleader=","

" Improve diff highlighting (so that I can actually see)
if &diff
    highlight! link DiffText MatchParen
endif

""" Vim-Plug """

" Download plug.vim if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ekalinin/dockerfile.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
call plug#end()

" GUI options
" Set default window size and colorscheme if using GUI
"
" NOTE: The "colorscheme" command must come AFTER calling the vim-colorscheme
" plugin. Otherwise, Vim will through an error due to not being able to find
" the provided colorscheme.
if has("gui_running")
    set lines=40
    set columns=120
    colorscheme atom
endif

" Syntastic settings
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['closurecompiler'] 
"let g:syntastic_javascript_closurecompiler_path = PUT UNIX PATH HERE

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

""" FUNCTIONS """

" Toggle between line number and relative line number
function! ToggleLineNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction
" vim:foldmethod=marker:foldlevel=0
