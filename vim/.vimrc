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

set nocompatible		" Don't try to be vi compatible
filetype off                  " required

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
    " Specify a directory for plugins
    " - For Neovim: stdpath('data') . '/plugged'
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/syntastic'
    Plug 'scrooloose/nerdcommenter'
    Plug 'lervag/vimtex'
    call plug#end()
    " set runtimepath^=~/.vim/bundle/nerdtree
    "set runtimepath^=~/.vim/bundle/vimtex

"*****************************************************************************
"" Basic Setup
"*****************************************************************************
    set clipboard=unnamedplus
    set hidden
    set mouse=a                         " automatically enable mouse usage
    set history=1000                    " Store a ton of history (defaul is 20)
    "set spell                           " spell checking on

    " ==================== Encoding ===================="
        set encoding=utf-8              " specifies encoding that Vim uses internally
        set fileencoding=utf-8          " specifies encoding that Vim uses for files
        set fileencodings=utf-8
        set ttyfast

    " ==================== Tabs ===================="
        set shiftwidth=4                " use indents of 4 spaces
        set expandtab                   " tabs are spaces, not tabs
        set tabstop=4                   " an indentation every four columns
        set softtabstop=4               " let backspace delete indent

    " ==================== Searching ===================="
        set hlsearch			        " highlight all search matches
        set incsearch                   " find as you type search
        set ignorecase                  " case insensitive search
        set smartcase                   " case sensitive when uc present
        set wildmenu                    " show list instead of just completing

        set nowrap                      " wrap long lines
        set autoindent                  " indent at the same level of the previous line
        set showcmd                     " show command in bottom bar
    " ==================== session management ===================="

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
    syntax on                           " Turn on syntax highlighting
    set number relativenumber			" Show line numbers
    set ruler                           " Show file stats
    "set rulerformat=%-14.(%l,%c%V%)\ %P
    set mousemodel=popup
    set cursorline                      " highlight current line
    " hi cursorline guibg=\#333333      " highlight bg color of current line
    " hi CursorColumn guibg=\#333333    " highlight cursor
    set showmatch                       " highlight matching [{()}]
    set showmode                        " display the current mode
    set background=dark
    "set background=light
    "color solarized                     " load a colorscheme
    color gruvbox

    " ==================== folding ===================="
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
    " Easier moving in tabs and windows
    " map <C-J> <C-W>j<C-W>_
    " map <C-K> <C-W>k<C-W>_
    " map <C-L> <C-W>l<C-W>_
    " map <C-H> <C-W>h<C-W>_
    " map <C-K> <C-W>k<C-W>_
    " jk is escape
    inoremap jk <esc>
    " turn off search highlight
    nnoremap <leader><space> :nohlsearch<CR>
    " save session
    nnoremap <leader>s :mksession<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

"*****************************************************************************
"" Convenience variables
"*****************************************************************************
" set tabpagemax=15               " only show 15 tabs
" set backspace=indent,eol,start  " backspace for dummys
" set linespace=0                 " No extra spaces between rows

filetype indent on      " load filetype-specific indent files
set lazyredraw          " redraw only when we need to.

set modelines=1
" vim:foldmethod=indent:foldlevel=0
