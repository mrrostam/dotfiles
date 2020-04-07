#!/bin/bash

dfdir=$(pwd)
mkdir .vim
git clone https://github.com/altercation/vim-colors-solarized.git $dfdir/solarized
mv $dfdir/solarized/colors $dfdir/.vim/
rm -r $dfdir/solarized

ln -sf $dfdir/.vim ~/.vim

