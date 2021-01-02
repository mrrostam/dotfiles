all: vim

editor: vim

bash:
	@echo "********** Bash setup *********"
	stow -S bash -t ${HOME}

vim: 
	@echo "********** Vim setup **********"
	stow -S vim -t ${HOME}

urxvt: 
	@echo "********** urxvt setup **********"
	stow -S urxvt -t ${HOME}

xorg: 
	@echo "********** xorg setup **********"
	stow -S x11 -t ${HOME}

alacritty: 
	@echo "********** alacritty setup **********"
	stow -S alacritty -t ${HOME}/.config

wallpapers: 
	@echo "********** wallpapers setup **********"
	stow -S wallpapers -t ${HOME}/Pictures

xfce:
	@echo "********** xfce setup **********"
	stow -S xfce -t ${HOME}/.config

fonts:
	@echo "********** fonts setup **********"
	stow -S fonts -t ${HOME}

ubuntu:

arch:

clean:
	stow -D vim -t ${HOME}

.PHONY: vim bash xorg xfce urxvt wallpapers alacritty
