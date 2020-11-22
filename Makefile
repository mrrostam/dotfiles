all: vim

editor: vim

vim: 
	@echo "********** Vim setup **********"
	stow -S vim -t ${HOME}

ubuntu:

arch:

clean:
	stow -D vim -t ${HOME}

.PHONY: vim
