OS := $(shell uname)
DOTFILE := $(shell pwd)

all:
	ln -fs $(DOTFILE)/zsh/.dotfiles ~

ifeq (, $(shell which git))
	sudo apt-get update -y
	sudo apt-get install git -y
endif

ifeq ($(OS),Linux)
	make _zsh _vim _git _tmux _ssh
else
	# Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	# Check for software updates daily, not just once per week
	defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
	# Avoid creating .DS_Store files on network volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	# Show the ~/Library folder
	chflags nohidden ~/Library
	# Use current directory as default search scope in Finder
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
	# Show icons for hard drives, servers, and removable media on the desktop
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
	defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
	defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  # Change screenshot folder
	defaults write com.apple.screencapture location ~/Downloads
	# Change screenshot filetype to png
	defaults write com.apple.screencapture type png

	make _homebrew _zsh _vim _git _tmux _ssh
endif

_zsh:
ifeq (, $(shell which zsh))
	sudo apt-get update -y
	sudo apt-get install zsh -y
endif
	rm ~/.zshrc
	ln -fs $(DOTFILE)/zsh/.zshrc ~/.zshrc

_vim:
	ln -fs $(DOTFILE)/vim/.vim ~/.vim
	ln -fs $(DOTFILE)/vim/.vimrc ~/.vimrc

_git:
	ln -fs $(DOTFILE)/git/.gitconfig ~/.gitconfig
	ln -fs $(DOTFILE)/git/.gitignore_global ~/.gitignore_global

_homebrew:
	@ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle --file=$(DOTFILE)/homebrew/Brewfile
	brew bundle --file=$(DOTFILE)/homebrew/Caskfile
    cp $(DOTFILE)/iterm2/com.googlecode.iterm2.plist ~/Library/Preferences
    chmod 600 ~/Library/Preferences/com.googlecode.iterm2.plist

_tmux:
	ln -fs $(DOTFILE)/tmux/.tmux.conf ~/.tmux.conf

_ssh:
	ln -fs $(DOTFILE)/ssh/.ssh ~/.ssh
