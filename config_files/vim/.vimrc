" ==================================================
    "   / __ \__  ______  ____ _____ ___  (_)  __
    "  / / / / / / / __ \/ __ `/ __ `__ \/ / |/_/
    " / /_/ / /_/ / / / / /_/ / / / / / / />  <
    "/_____/\__, /_/ /_/\__,_/_/ /_/ /_/_/_/|_|
    "      /____/
    " Filename:     .vimrc
    " Github:       https://github.com/mrrostam/dotfiles
    " Maintainer:   Pouya Rostam (Dynamix)
    " Modified:     Sun Feb 13 11:26:45 AM PST 2022
" ==================================================

" Sections:
"    -> General
"    -> Vim-PLug core
"    -> Basics
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Spell checking
"    -> Misc
"    -> Helper functions

" ****************************************
"  General
" ****************************************

    set nocompatible        " Don't try to be vi compatible
    filetype off            " Helps force plugins to load correctly when it is turned back on below

    set exrc                " This option forces Vim to source .vimrc file if it present in working directory
    set secure

    let g:mapleader = ","

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

    " ------------------------------
        Plug 'tpope/vim-obsession'
	Plug 'tpope/vim-commentary'
    " markdown----------------------
    " latex-------------------------
        Plug 'lervag/vimtex'
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

" ****************************************
"  VIM user interface
" ****************************************

" ****************************************
"  Colors and Fonts
" ****************************************

    colorscheme onedark

" ****************************************
"  Files and backups
" ****************************************

    autocmd FileType tex,latex,markdown setlocal spell

" ****************************************
"  Text, tab and indent related
" ****************************************

" ****************************************
"  Visual mode related
" ****************************************

    set cursorline                      " highlight current line
    set number relativenumber           " Show line numbers
    set ttyfast

" ****************************************
"  Moving around, tabs and buffers
" ****************************************

" ****************************************
"  Status line
" ****************************************

    set showcmd                     " show command in bottom bar

" ****************************************
"  Editing mappings
" ****************************************

" ****************************************
"  Spell checking
" ****************************************

    set spelllang=en_us,en_ca
    set spellfile=~/.vim/spell/en.utf-8.add
    set thesaurus+=~/.vim/thesaurus/mthesaur.txt

" ****************************************
"  Helper functions
" ****************************************

" ****************************************
"  Pluging configs
" ****************************************
    let g:vimtex_view_method = 'zathura'
