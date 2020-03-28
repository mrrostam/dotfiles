"   / __ \__  ______  ____ _____ ___  (_)  __
"  / / / / / / / __ \/ __ `/ __ `__ \/ / |/_/
" / /_/ / /_/ / / / / /_/ / / / / / / />  <  
"/_____/\__, /_/ /_/\__,_/_/ /_/ /_/_/_/|_|  
"      /____/                                
" Filename:     .vimrc
" Github:       https://github.com/mrrostam/dotfiles
" Maintainer:   Pouya Rostam (Dynamix)


inoremap jk <ESC>
syntax on
set encoding=utf-8
set clipboard=unnamedplus
set nocompatible              " required
set tabstop=4
set shiftwidth=4
set expandtab
set number
set autoindent
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" Plugin 'vim-python/python-syntax'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
