export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm composer zsh-syntax-highlighting z keychain zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$PATH"

# Composer bin
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load NVM
[[ -s "$HOME/.nvm" ]] && . "$HOME/.nvm/nvm.sh"
export PATH="`yarn global bin`:$PATH"

# Load Z
[[ -s "$HOME/dotfiles/z" ]] && . "$HOME/dotfiles/z/z.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/killtw/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/killtw/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/killtw/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/killtw/google-cloud-sdk/completion.zsh.inc'; fi
