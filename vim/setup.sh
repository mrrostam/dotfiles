#!/bin/bash

dfvdir=$(pwd)
#mkdir .vim

#colorscheme
mkdir colors
git clone https://github.com/altercation/vim-colors-solarized.git $dfvdir/solarized
git clone https://github.com/morhetz/gruvbox.git $dfvdir/gruvbox
mv $dfvdir/solarized/colors/* $dfvdir/colors
mv $dfvdir/gruvbox/colors/* $dfvdir/colors
rm -rf $dfvdir/solarized
rm -rf $dfvdir/gruvbox

#plugin
curl -fLo $dfvdir/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir plugged

#linking
ln -nsf $dfvdir/plugged ~/.vim/plugged
ln -nsf $dfvdir/colors ~/.vim/colors
ln -nsf $dfvdir/autoload ~/.vim/autoload 

vim +'PlugInstall --sync' +qa
