OS := $(shell uname)

.PHONY: all

all:
ifeq (, $(shell which git))
	sudo apt-get update -y
	sudo apt-get install git -y
endif

ifneq ($(OS),Linux)
	osx
endif
	linux

osx: _homebrew _iterm2 _osx _app

linux: _zsh _vim _git _kube

_zsh:
ifeq (, $(shell which zsh))
	sudo apt-get update -y
	sudo apt-get install zsh -y
endif
	test -L ${HOME}/.zshrc || rm -rf ${HOME}/.zshrc
	ln -fs "${PWD}/zsh/zshrc" ${HOME}/.zshrc
	ln -fs "${PWD}/zsh/zinit" ${HOME}/.zinit
	ln -fs "${PWD}/zsh/aliases" ${HOME}/.aliases
	ln -fs "${PWD}/zsh/starship.toml" ${HOME}/.config/starship.toml

	ln -fs "${PWD}/tmux/tmux.conf" ${HOME}/.tmux.conf
	ln -sf {"${PWD}",${HOME}}/.ssh

_vim:
	ln -fs "${PWD}/vim/vim/"* ${HOME}/.vim
	ln -fs "${PWD}/vim/vimrc" ${HOME}/.vimrc

_git:
	ln -fs "${PWD}/git/.gitconfig" ~/.gitconfig
	ln -fs "${PWD}/git/.gitignore_global" ~/.gitignore_global

_homebrew:
	@bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file="${PWD}/homebrew/Brewfile" --no-lock
	brew bundle --file="${PWD}/homebrew/Caskfile" --no-lock

_iterm2:
	cp "${PWD}/iterm2/com.googlecode.iterm2.plist" ~/Library/Preferences
	chmod 600 ~/Library/Preferences/com.googlecode.iterm2.plist

_osx:
	killall cfprefsd

    # Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	# Check for software updates daily, not just once per week
	defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
    # Download newly available updates in background
	defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
	# Avoid creating .DS_Store files on network volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	# Show the ~/Library folder
	chflags nohidden ~/Library
	# Use current directory as default search scope in Finder
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
	# Show icons for hard drives, servers, and removable media on the desktop
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
	defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
	defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
    # Change screenshot folder
	defaults write com.apple.screencapture location ~/Downloads
	# Change screenshot filetype to png
	defaults write com.apple.screencapture type png
    # tab moves focus through All controls
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
    # tap to click
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
    # Keep folders on top when sorting by name
	defaults write com.apple.finder _FXSortFoldersFirst -bool true
    # enable three fingers drag
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
	defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

	killall Finder

_kube:
	ln -fs "${PWD}/.kube/config" ${HOME}/.kube/config
	chmod go-r ${HOME}/.kube/config

 _app:
	ln -fs "${PWD}/logseq" ${HOME}/.logseq
	ln -fs "${PWD}/alacritty" ${HOME}/.config/alacritty
