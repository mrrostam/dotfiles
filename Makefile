.PHONY: arch fedora ubuntu vim touchegg wallpapers alacritty

arch: 
	mkdir -p ~/.config
	sudo pacman -S --needed \
		neovim \
		vim \
		stow \
		fzf	\
		ripgrep \
		alacritty \
		kitty \
		tmux \
		emacs \
		zsh

fonts:
	@echo "********** fonts setup **********"
	mkdir -p ${HOME}/.local/share/fonts/
	stow -d config_files -S fonts -t ${HOME}/.local/share/fonts

vim:
	@echo "********** vim setup **********"
	stow -d config_files -t ~ -S vim

touchegg:
	@echo "********** touchegg setup **********"
	stow -d config_files -t ~/.config/ -S touchegg

wallpapers:
	@echo "********** wallpapers setup **********"
	mkdir -p ${HOME}/Pictures/wallpapers
	stow -d config_files -t ${HOME}/Pictures/wallpapers -S wallpapers

alacritty:
	@echo "********** alacritty setup **********"
	stow -d config_files -t ~/.config/ -S alacritty

tmux:
	@echo "********** tmux setup **********"
	stow -d config_files -t ~ -S tmux2

kitty:
	@echo "********** kitty setup **********"
	stow -d config_files -t ~/.config -S kitty

emacs:
	@echo "********** emacs setup **********"
	stow -d config_files -t ~/.config -S emacs

zsh:
	@echo "********** zsh setup **********"
	stow -d config_files -t ~/.config -S zsh
