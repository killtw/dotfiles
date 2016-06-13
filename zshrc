# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="killtw"

# aliases
. ~/dotfiles/aliases
# functional
. ~/dotfiles/functional

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="false"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm npm composer zsh-syntax-highlighting z keychain zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/bin:$PATH"

# MAMP PHP
export PATH="/Applications/MAMP/bin/php/php7.0.0/bin:$PATH"
# Composer bin
export PATH="$HOME/.composer/vendor/bin:$PATH"
# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# RVM
#export PATH="$PATH:$HOME/.rvm/bin"

# Load NVM
[[ -s "$HOME/.nvm" ]] && . "$HOME/.nvm/nvm.sh"

# Load RVM
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Load Z
[[ -s "$HOME/dotfiles/z" ]] && . "$HOME/dotfiles/z/z.sh"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
