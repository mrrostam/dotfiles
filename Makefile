all: vim \
	nvim \
	emacs \
	i3 \
	bash \
	urxvt \
	fonts

editor: vim nvim emacs

i3: i3blocks i3status rofi 
	@echo "********** i3 setup **********"
	mkdir -p ${HOME}/.config
	stow -S i3 -t ${HOME}

i3blocks: scripts 
	@echo "********** i3blocks setup **********"
	mkdir -p ${HOME}/.config
	stow -S i3blocks -t ${HOME}

i3status: scripts 
	@echo "********** i3status setup **********"
	mkdir -p ${HOME}/.config
	stow -S i3status -t ${HOME}

rofi: Xresources
	@echo "********** rofi setup **********"
	mkdir -p ${HOME}/.config
	stow -S rofi -t ${HOME}

Xresources:
	@echo "********** Xresources setup **********"
	mkdir -p ${HOME}/.config
	stow -S Xresources -t ${HOME}

vim: 
	@echo "********** Vim setup **********"
	stow -S vim -t ${HOME}

nvim:
	@echo "********** Vim setup **********"
	stow -S vim -t ${HOME}

emacs:
	@echo "********** Vim setup **********"
	stow -S vim -t ${HOME}

bash:
	@echo "********** Bash setup **********"
	stow -S bash -t ${HOME}

urxvt:
	@echo "********** urxvt setup **********"
	mkdir -p ${HOME}/.config
	stow -S urxvt -t ${HOME}

scripts:
	@echo "********** scripts setup **********"
	mkdir -p ${HOME}/.local
	stow -S scripts -t ${HOME}

fonts:
	@echo "********** fonts setup **********"
	stow -S fonts -t ${HOME}

ubuntu:

arch:

clean:
	stow -D vim -t ${HOME}
	stow -D bash -t ${HOME}
	stow -D urxvt -t ${HOME}
	stow -D fonts -t ${HOME}

.PHONY: vim i3 i3blocks i3status rofi scripts bash urxvt fonts\
	clean
