all: vim

editor: vim

bash:
	@echo "********** Bash setup *********"
	stow -S bash -t ${HOME}

vim: 
	@echo "********** Vim setup **********"
	stow -S vim -t ${HOME}

xorg: 
	@echo "********** xorg setup **********"
	stow -S x11 -t ${HOME}

xfce:
	@echo "********** xfce setup **********"
	stow -S xfce -t ${HOME}/.config

ubuntu:

arch:

clean:
	stow -D vim -t ${HOME}

.PHONY: vim bash xorg xfce
