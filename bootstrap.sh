#!/bin/sh
# ==================================================
	#   / __ \__  ______  ____ _____ ___  (_)  __
	#  / / / / / / / __ \/ __ `/ __ `__ \/ / |/_/
	# / /_/ / /_/ / / / / /_/ / / / / / / />  <
	#/_____/\__, /_/ /_/\__,_/_/ /_/ /_/_/_/|_|
	#      /____/
	# File:     	bootstrap
	# Github:       https://github.com/mrrostam/dotfiles
	# Maintainer:   Pouya Rostam (Dynamix)
# ==================================================

### OPTIONS AND VARIABLES ###

while getopts ":a:r:b:p:h" o; do case "${o}" in
    h) printf "Optional arguments for custom use:\\n  -r: Dotfiles repository (local file or url)\\n  -p: Dependencies and programs csv (local file or url)\\n  -a: AUR helper (must have pacman-like syntax)\\n  -h: Show this message\\n" && exit 1 ;;
    r) dotfilesrepo=${OPTARG} && git ls-remote "$dotfilesrepo" || exit 1 ;;
    b) repobranch=${OPTARG} ;;
    p) progsfile=${OPTARG} ;;
    a) aurhelper=${OPTARG} ;;
    *) printf "Invalid option: -%s\\n" "$OPTARG" && exit 1 ;;
esac done

# if [ $1 = "arch" ]; then
# 	echo bootstraping Arch linux ...
# 	pacman -Syu
# 	pacman -S --noconfirm \
# 		make \
# 		elinks \
# 		gcc \
# 		git \
# 		neovim \
# 		stow \
# 		vim \
# 		emacs \
# 		tmux
# 	make $1
# elif [ $1 = "mac" ]; then
# 	echo bootstraping macOS ...
# 	brew install \
# 		neovim \
# 		vim \
# 		stow \
# 		cask \
# 		tmux \
# 		midnight-commander \
# 		ranger
# 	brew install --cask \
# 		visual-studio-code \
# 		iterm2 \
# 		emacs
# 	make $1
# elif [ $1 = "fedora" ]; then
# 	echo bootstraping Fedora ...
# 	make $1
# elif [ $1 = "ubuntu" ]; then
# 	echo bootstraping Ubuntu ...
# 	make $1
# else
# 	echo specify a valid linux distro please
# fi
