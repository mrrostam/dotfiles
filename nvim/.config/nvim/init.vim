" ================================================== 
    "   / __ \__  ______  ____ _____ ___  (_)  __
    "  / / / / / / / __ \/ __ `/ __ `__ \/ / |/_/
    " / /_/ / /_/ / / / / /_/ / / / / / / />  <  
    "/_____/\__, /_/ /_/\__,_/_/ /_/ /_/_/_/|_|  
    "      /____/                                
    " Filename:     init.vim
    " Github:       https://github.com/mrrostam/dotfiles
    " Maintainer:   Pouya Rostam (Dynamix)
"================================================== 

filetype off            " required

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
    " Specify a directory for plugins
    " - For Neovim: stdpath('data') . '/plugged'
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.config/nvim/plugged')
    " Make sure you use single quotes
    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    " Plug 'junegunn/vim-easy-align'
    " Any valid git URL is allowed
    " Plug 'https://github.com/junegunn/vim-github-dashboard.git'
    " Multiple Plug commands can be written in a single line using | separators
    " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " On-demand loading
    " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    " Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
    " Using a non-master branch
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
    " Plug 'fatih/vim-go', { 'tag': '*' }
    " Plugin options
    " Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
    " Plugin outside ~/.vim/plugged with post-update hook
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Unmanaged plugin (manually installed and updated)
    " Plug '~/my-prototype-plugin'
    " Initialize plugin system
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'tpope/vim-fugitive'
    " Plug 'majutsushi/tagbar'
    " Plug 'valloric/youcompleteme'
    " Plug 'mattn/emmet-vim'
    " Plug 'tpope/vim-commentary'
    " Plug 'w0rp/ale'
    " Plug 'godlygeek/tabular'
    " Plug 'ervandew/supertab'
    " Plug 'junegunn/fzf'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'scrooloose/nerdtree'
    " Plug 'tpope/vim-surround'
    " Plug 'vim-scripts/AdvancedSorters'
    " Plug 'junegunn/goyo.vim'
    " Plug 'junegunn/limelight.vim'
    " Plug 'sbdchd/neoformat'
    " Plug 'Shougo/neosnippet.vim'
    " Plug 'honza/vim-snippets'
    " Plug 'deoplete-plugins/deoplete-jedi'
    " Plug 'honza/vim-snippets'
    " Plug 'deoplete-plugins/deoplete-jedi'
    Plug 'lervag/vimtex'                    " A modern vim plugin for editing LaTeX files.
    Plug 'scrooloose/syntastic'             " Syntax checking hacks for vim
    Plug 'scrooloose/nerdcommenter'         " Vim plugin for intensely nerdy commenting powers
    Plug 'vim-airline/vim-airline'          " Lean & mean status/tabline for vim that's light as air
    Plug 'vim-airline/vim-airline-themes'   " A collection of themes for vim-airline
    Plug 'dpelle/vim-languagetool'
    Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'majutsushi/tagbar'
    " Plug 'beloglazov/vim-online-thesaurus'
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Dark powered asynchronous completion framework 
    else
        Plugin 'valloric/youcompleteme'     " A code-completion engine for Vim
    endif
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " Plug 'Shougo/neosnippet-snippets' | Plug 'Shougo/neosnippet.vim'
    " Plug 'Shougo/neosnippet.vim'
    " Plug 'Shougo/neosnippet-snippets'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-airline/vim-airline'
    " ==================== Themes  ===================="
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'chriskempson/base16-vim'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'joshdick/onedark.vim'
    call plug#end()
    filetype plugin indent on    " required

"*****************************************************************************
"" Plugin configuration
"*****************************************************************************
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1

    let g:languagetool_jar='$HOME/languagetool/languagetool-standalone/target/LanguageTool-5.0-SNAPSHOT/LanguageTool-5.0-SNAPSHOT/languagetool-commandline.jar'
    " let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
    let g:deoplete#enable_at_startup = 1
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

    let g:airline_theme='nord'
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    " let g:airline_left_sep=''
    " let g:airline_right_sep=''
    
    " air-line
    " if !exists('g:airline_symbols')
        " let g:airline_symbols = {}
    " endif

    " unicode symbols
        "let g:airline_left_sep = '»'
        "let g:airline_left_sep = '▶'
        "let g:airline_right_sep = '«'
        "let g:airline_right_sep = '◀'
        "let g:airline_symbols.linenr = '␊'
        "let g:airline_symbols.linenr = '␤'
        "let g:airline_symbols.linenr = '¶'
        "let g:airline_symbols.branch = '⎇'
        "let g:airline_symbols.paste = 'ρ'
        "let g:airline_symbols.paste = 'Þ'
        "let g:airline_symbols.paste = '∥'
        "let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
        "let g:airline_left_sep = ''
        "let g:airline_left_alt_sep = ''
        "let g:airline_right_sep = ''
        "let g:airline_right_alt_sep = ''
        "let g:airline_symbols.branch = ''
        "let g:airline_symbols.readonly = ''
        "let g:airline_symbols.linenr = ''
"*****************************************************************************
"" Basic Setup
"*****************************************************************************
    set clipboard=unnamedplus
    set hidden
    set mouse=a                         " automatically enable mouse usage
    set history=1000                    " Store a ton of history (defaul is 20)
    "set spell                           " spell checking on
    set spelllang=en_us,en_ca
    set spellfile=~/.vim/spell/en.utf-8.add
    set thesaurus+=~/.vim/thesaurus/mthesaur.txt
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
        set wildmode=full
        set nowrap                      " wrap long lines
        "set wrap linebreak nolist
        set autoindent                  " indent at the same level of the previous line
        set showcmd                     " show command in bottom bar
    " ==================== session management ===================="

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
    syntax on                           " Turn on syntax highlighting
    set omnifunc=syntaxcomplete#Complete
    set number relativenumber			" Show line numbers
    set ruler                           " Show file stats
    "set rulerformat=%-14.(%l,%c%V%)\ %P
    set mousemodel=popup
    set cursorline                      " highlight current line
    " hi cursorline guibg=\#333333      " highlight bg color of current line
    " hi CursorColumn guibg=\#333333    " highlight cursor
    set showmatch                       " highlight matching [{()}]
    set showmode                        " display the current mode
    "color solarized                     " load a colorscheme
    "color gruvbox

    " colorscheme nord
    colorscheme nord
    set background=dark
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
    " Plugin key-mappings.
    " " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    " imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    " smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    " xmap <C-k>     <Plug>(neosnippet_expand_target)
"*****************************************************************************
"" Custom configs
"*****************************************************************************
" Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240

" let g:vimtex_quickfix_mode=0
" set conceallevel=1

" It should be:
" let g:tex_conceal='abdmg'
" Use deoplete.
" let g:deoplete#enable_at_startup = 1
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" This is new style
" call deoplete#custom#var('omni', 'input_patterns', {
      " \ 'tex': g:vimtex#re#deoplete
      " \})
"*****************************************************************************
"" Convenience variables
"*****************************************************************************
" set tabpagemax=15               " only show 15 tabs
" set backspace=indent,eol,start  " backspace for dummys
" set linespace=0                 " No extra spaces between rows

set lazyredraw          " redraw only when we need to.

set modelines=1
" vim:foldmethod=indent:foldlevel=0
