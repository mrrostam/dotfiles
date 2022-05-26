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

ubuntu:
	mkdir -p ~/.config
	sudo apt install -y \
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

fedora:
	mkdir -p ~/.config
	sudo dnf install -y \
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

fonts:
	@echo "********** fonts setup **********"
	mkdir -p ~/.local/share/fonts/
	stow -d config_files -S fonts -t ~/.local/share/fonts
	fc-cache -f -v

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

ranger:
	@echo "********** ranger setup **********"
	stow -d config_files -t ~/.config/ -S ranger

tmux:
	@echo "********** tmux setup **********"
	stow -d config_files -t ~ -S tmux2

kitty:
	@echo "********** kitty setup **********"
	stow -d config_files -t ~/.config -S kitty

neovim:
	@echo "********** neovim setup **********"
	stow -d config_files -t ~/.config -S neovim

emacs:
	@echo "********** emacs setup **********"
	stow -d config_files -t ~/.config -S emacs

zsh:
	@echo "********** zsh setup **********"
	stow -d config_files -t ~ -S zsh
	antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

bash:
	@echo "********** bash setup **********"
	stow -d config_files -t ~/.config -S bash
