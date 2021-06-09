all: vim

editor: vim

ubuntu:
	@echo "********** init ubuntu system *****"
	sudo apt update
	sudo apt upgrade
	sudo apt install vim neovim stow alacritty tmux
	sudo pacman -S vim neovim stow alacritty tmux

arch:
	@echo "********** init arch system *****"
	sudo pacman -Syu
	sudo pacman -S vim neovim stow alacritty tmux ctags

bash:
	@echo "********** Bash setup *********"
	stow -S bash -t ${HOME}

kde:
	@echo "		KDE setup"
	stow -S kde -t ${HOME}/.config

vim: 
	@echo "********** Vim setup **********"
	stow -S vim -t ${HOME}

wallpapers: 
	@echo "********** wallpapers setup **********"
	mkdir -p ${HOME}/Pictures/my_pic
	stow -S wallpapers -t ${HOME}/Pictures/my_pic

fonts:
	@echo "********** fonts setup **********"
	mkdir -p ${HOME}/.local/share/fonts/
	stow -S fonts -t ${HOME}/.local/share/fonts

alacritty: 
	@echo "********** alacritty setup **********"
	stow -S alacritty -t ${HOME}/.config

zsh:
	@echo "		zsh setup"
	stow -S zsh -t ${HOME}

clean:
	stow -D bash -t ${HOME}
	stow -D vim -t ${HOME}
	stow -D alacritty -t ${HOME}/.config

# urxvt: 
# 	@echo "********** urxvt setup **********"
# 	stow -S urxvt -t ${HOME}

# xorg: 
# 	@echo "********** xorg setup **********"
# 	stow -S x11 -t ${HOME}

# xfce:
# 	@echo "********** xfce setup **********"
# 	stow -S xfce -t ${HOME}/.config

.PHONY: vim bash wallpapers fonts alacritty kde zsh
