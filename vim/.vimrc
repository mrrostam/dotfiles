" ================================================== 
    "   / __ \__  ______  ____ _____ ___  (_)  __
    "  / / / / / / / __ \/ __ `/ __ `__ \/ / |/_/
    " / /_/ / /_/ / / / / /_/ / / / / / / />  <  
    "/_____/\__, /_/ /_/\__,_/_/ /_/ /_/_/_/|_|  
    "      /____/                                
    " Filename:     .vimrc
    " Github:       https://github.com/mrrostam/dotfiles
    " Maintainer:   Pouya Rostam (Dynamix)
" ==================================================

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
    " ========== Python =========="
        Plug 'vim-scripts/indentpython.vim'
        Plug 'hdima/python-syntax'
    " ========== C =========="
        Plug 'vim-scripts/c.vim'
    " ========== Markdown =========="
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
    " ========== File finder =========="
        Plug 'scrooloose/nerdtree'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
    " ========== Misc. =========="
        Plug 'scrooloose/syntastic'
        Plug 'sheerun/vim-polyglot'
        Plug 'tpope/vim-commentary'
        Plug 'scrooloose/syntastic'
        Plug 'vim-scripts/loremipsum'
    " ==================== themes ===================="
        Plug 'arcticicestudio/nord-vim'
        Plug 'chriskempson/base16-vim'
        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'joshdick/onedark.vim'
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
    set tags=tags;/
"*****************************************************************************
"" Visual Settings
"*****************************************************************************
    set number relativenumber           " Show line numbers
    set cursorline                      " highlight current line
    " =================== theme ==================== " 
    " colorscheme base16-tomorrow-night
    " set termguicolors
    colorscheme onedark
    set background=dark
    set t_Co=256                        " for tmux
    "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
    "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
    "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
    if (empty($TMUX))
      if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      endif
      "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
      "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
      " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
      if (has("termguicolors"))
        set termguicolors
      endif
    endif
    if &term == "alacritty"        
          let &term = "xterm-256color"
    endif
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
    " Plugin : fzf
        nnoremap <silent> <C-f> :Files<CR>
"*****************************************************************************
"" Custom configs
"*****************************************************************************
    " Vim
        let g:mapleader = ' '
    " Plugin
    " Python
        let g:python_highlight_all = 1
"*****************************************************************************
"" Convenience variables
"*****************************************************************************

"*****************************************************************************
"" file-type specifice
"*****************************************************************************
autocmd FileType tex,latex,markdown setlocal spell
