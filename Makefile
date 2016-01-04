OS := $(shell uname)
DOTFILE := $(shell pwd)

all:
	ln -fs $(DOTFILE)/dotfiles ~

ifeq (, $(shell which git))
	sudo apt-get update -y
	sudo apt-get install git -y
endif

ifeq ($(OS),Linux)
	make _zsh _vim _git _tmux
else
	# Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	# Check for software updates daily, not just once per week
	defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
	# Avoid creating .DS_Store files on network volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	# Show the ~/Library folder
	chflags nohidden ~/Library

	make _homebrew _zsh _vim _git _nvm _rvm _tmux
endif
_zsh:
ifeq (, $(shell which zsh))
	sudo apt-get update -y
	sudo apt-get install zsh -y
endif
	@sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	rm ~/.zshrc
	ln -fs $(DOTFILE)/zshrc ~/.zshrc
	ln -fs $(DOTFILE)/oh-my-zsh/custom/*.zsh-theme ~/.oh-my-zsh/custom
	ln -fs $(DOTFILE)/oh-my-zsh/custom/plugins/* ~/.oh-my-zsh/custom/plugins
_vim:
	ln -fs $(DOTFILE)/vim ~/.vim
	ln -fs $(DOTFILE)/vimrc ~/.vimrc
_git:
	ln -fs $(DOTFILE)/gitconfig ~/.gitconfig
	ln -fs $(DOTFILE)/gitignore_global ~/.gitignore_global
_homebrew:
	@ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle
	brew bundle --file=$(DOTFILE)/Caskfile
_nvm:
	@sh -c "$$(curl -fsSL https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh)"
_rvm:
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	curl -sSL https://get.rvm.io | bash -s stable
_tmux:
	ln -fs $(DOTFILE)/tmux.conf ~/.tmux.conf
