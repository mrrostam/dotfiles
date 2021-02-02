" ================================================== 
    "   / __ \__  ______  ____ _____ ___  (_)  __
    "  / / / / / / / __ \/ __ `/ __ `__ \/ / |/_/
    " / /_/ / /_/ / / / / /_/ / / / / / / />  <  
    "/_____/\__, /_/ /_/\__,_/_/ /_/ /_/_/_/|_|  
    "      /____/                                
    " Filename:     .vimrc
    " Github:       https://github.com/mrrostam/dotfiles
    " Maintainer:   Pouya Rostam (Dynamix)
"==================================================

set nocompatible    " Don't try to be vi compatible
filetype off        " Helps force plugins to load correctly when it is turned back on below

set exrc " This option forces Vim to source .vimrc file if it present in working directory
set secure

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.vim/plugged')
    " ==================== packages ===================="
    Plug 'hdima/python-syntax'
    Plug 'junegunn/fzf'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
    Plug 'vim-scripts/c.vim'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-scripts/loremipsum'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    " ==================== themes ===================="
    Plug 'arcticicestudio/nord-vim'
    Plug 'chriskempson/base16-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'morhetz/gruvbox'
    call plug#end()
    filetype plugin indent on    " required

"*****************************************************************************
"" Basic Setup
"*****************************************************************************
    set clipboard=unnamedplus       " using the clipboard as the default register
    set hidden                      " hide buffers
    set mouse=a                     " automatically enable mouse usage
    set history=1000                " Store a ton of history (defaul is 20)
    set path+=**                    " vim kind-of fuzzy finder
    " set spell                     " spell checking on
    set spelllang=en_us,en_ca
    set spellfile=~/.vim/spell/en.utf-8.add
    set thesaurus+=~/.vim/thesaurus/mthesaur.txt
    " ==================== Encoding ==================== "
    set encoding=utf-8              " specifies encoding that Vim uses internally
    set fileencoding=utf-8          " specifies encoding that Vim uses for files
    set fileencodings=utf-8
    set ttyfast
    " ==================== Tabs ==================== "
    set shiftwidth=4                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    " ==================== Searching ==================== "
    set hlsearch                    " highlight all search matches
    set incsearch                   " find as you type search
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set nowrap                      " wrap long lines
    "set wrap linebreak nolist
    set autoindent                  " indent at the same level of the previous line
    set showcmd                     " show command in bottom bar
    set breakindent                 " enable indentation
    set breakindentopt=shift:2,min:40,sbr
    set showbreak=>>                " append '>>' to indent
    " ==================== session management ==================== "

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
    set number relativenumber           " Show line numbers
    set cursorline                      " highlight current line
    " =================== theme ==================== " 
    " colorscheme base16-tomorrow-night
    " set termguicolors
    colorscheme gruvbox
    set background=dark
    set t_Co=256                        " for tmux
    " ==================== folding ==================== "
    set foldenable                      " enable folding
    set foldlevelstart=10               " open most folds by default
    set foldmethod=indent               " fold based on indent level
"*****************************************************************************
"" Abbreviations
"*****************************************************************************

"*****************************************************************************
"" Commands
"*****************************************************************************

"*****************************************************************************
"" Functions
"*****************************************************************************

"*****************************************************************************
"" Mappings
"*****************************************************************************
    nnoremap <silent> <C-f> :Files<CR>
"*****************************************************************************
"" Custom configs
"*****************************************************************************

"*****************************************************************************
"" Convenience variables
"*****************************************************************************
