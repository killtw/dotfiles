export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="killtw"

# aliases
. ~/dotfiles/aliases
# functional
. ~/dotfiles/functional

# DISABLE_AUTO_UPDATE="false"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(zsh-syntax-highlighting z keychain zsh-autosuggestions asdf kubectl kops helm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$HOME/bin:$PATH"

# Composer bin
export PATH="$HOME/.composer/vendor/bin:$PATH"

export PATH="`yarn global bin`:$PATH"
export GOPATH="$HOME/go"

# Load Z
[[ -s "$HOME/dotfiles/z" ]] && . "$HOME/dotfiles/z/z.sh"
