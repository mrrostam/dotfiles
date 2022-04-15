" ==================================================
"   / __ \__  ______  ____ _____ ___  (_)  __
"  / / / / / / / __ \/ __ `/ __ `__ \/ / |/_/
" / /_/ / /_/ / / / / /_/ / / / / / / />  <
"/_____/\__, /_/ /_/\__,_/_/ /_/ /_/_/_/|_|
"      /____/
" Filename:     .vimrc
" Github:       https://github.com/mrrostam/dotfiles
" Maintainer:   Pouya Rostam (Dynamix)
" Modified:     Fri Apr  8 05:59:32 AM PDT 2022
" ==================================================

" ****************************************
"  General
" ****************************************

set nocompatible        " Don't try to be vi compatible
filetype off            " Helps force plugins to load correctly when it is turned back on below

set exrc                " This option forces Vim to source .vimrc file if it present in working directory
set secure

set wildmenu            " show list instead of just completing

nnoremap <space> <NOP>
let mapleader = " "

" fixed truecolor for tmux env
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" ****************************************
"  Vim-PLug core
" ****************************************

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" general-----------------------
source ~/.vim/plugged/vim-airline.vim
source ~/.vim/plugged/vim-commentary.vim
source ~/.vim/plugged/vim-obsession.vim
" language-support--------------
source ~/.vim/plugged/vimtex.vim
source ~/.vim/plugged/fzfvim.vim
" themes------------------------
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on
syntax on

" ****************************************
"  Basics
" ****************************************

set hidden                      " hide buffers
set mouse=a                     " automatically enable mouse usage
set history=1000                " Store a ton of history (default is 20)
set path+=**                    " vim kind-of fuzzy finder
set clipboard=unnameplus

" ****************************************
"  Colors and Fonts
" ****************************************

set termguicolors
colorscheme onedark

" ****************************************
"  Files and backups
" ****************************************

augroup filetype_latex
    autocmd!
    autocmd FileType tex,latex,markdown setlocal spell
    autocmd FileType tex,latex,markdown setlocal wrap
augroup END

" ****************************************
"  Text, tab and indent related
" ****************************************

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent

" ****************************************
"  Visual mode related
" ****************************************

set cursorline
set list
set listchars=tab:▶\ ,trail:.
set nowrap
set number relativenumber
set scrolloff=8
set ttyfast

" ****************************************
"  Search config
" ****************************************

set hlsearch
set ignorecase
set ignorecase
set incsearch
set smartcase

" ****************************************
"  Moving around, tabs and buffers
" ****************************************

set splitright
set splitbelow

" ****************************************
"  Status line
" ****************************************

set showcmd

" ****************************************
"  Editing mappings
" ****************************************

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
nnoremap gf :edit <cfile><cr>

" ****************************************
"  Spell checking
" ****************************************

set spelllang=en_us,en_ca
set spellfile=~/.vim/spell/en.utf-8.add
set thesaurus+=~/.vim/thesaurus/mthesaur.txt

" ****************************************
"  Abbreviations
" ****************************************

iabbrev @@  pooya.rostam@gmail.com

" ****************************************
"  Helper functions
" ****************************************

