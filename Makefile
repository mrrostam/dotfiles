.PHONY: arch fedora ubuntu vim touchegg wallpapers alacritty

arch:
	mkdir -p ~/.config
	sudo pacman -S --needed \
		alacritty \
		base-devel \
		curl \
		emacs \
		fzf \
		git \
		kitty \
		neovim \
		ripgrep \
		stow \
		tmux \
		vim \
		zsh
	mkdir -p .aur && cd .aur && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

fonts:
	@echo "********** fonts setup **********"
	mkdir -p ~/.local/share/fonts/
	stow -d config_files -S fonts -t ~/.local/share/fonts

vim:
	@echo "********** vim setup **********"
	stow -d config_files -t ~ -S vim

touchegg:
	@echo "********** touchegg setup **********"
	stow -d config_files -t ~/.config/ -S touchegg

wallpapers:
	@echo "********** wallpapers setup **********"
	mkdir -p ~/Pictures/wallpapers
	stow -d config_files -t ~/Pictures/wallpapers -S wallpapers

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
	stow -d config_files -t ~ -S zsh

bash:
	@echo "********** bash setup **********"
	stow -d config_files -t ~/.config -S bash
