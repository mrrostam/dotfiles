" ==================================================
    "   / __ \__  ______  ____ _____ ___  (_)  __
    "  / / / / / / / __ \/ __ `/ __ `__ \/ / |/_/
    " / /_/ / /_/ / / / / /_/ / / / / / / />  <
    "/_____/\__, /_/ /_/\__,_/_/ /_/ /_/_/_/|_|
    "      /____/
    " Filename:     .vimrc
    " Github:       https://github.com/mrrostam/dotfiles
    " Maintainer:   Pouya Rostam (Dynamix)
    " Modified:     Sun Apr  3 09:38:15 AM PDT 2022
" ==================================================

" ****************************************
"  General
" ****************************************

    set nocompatible        " Don't try to be vi compatible
    filetype off            " Helps force plugins to load correctly when it is turned back on below

    set exrc                " This option forces Vim to source .vimrc file if it present in working directory
    set secure

    set wildmenu            " show list instead of just completing

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
        source ~/.vim/plugged/vim-obsession.vim
        Plug 'tpope/vim-commentary'
    " markdown----------------------
    " latex-------------------------
        source ~/.vim/plugged/vimtex.vim
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
    set list
    set listchars=tab:▶\ ,trail:.

" ****************************************
"  Visual mode related
" ****************************************

    set cursorline
    set number relativenumber
    set scrolloff=8
    set ttyfast
    set nowrap

" ****************************************
"  Search config
" ****************************************
    set ignorecase
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
    nnoremap <space> <NOP>
    let mapleader = " "
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
