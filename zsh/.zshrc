HOMEBREW_NO_AUTO_UPDATE=1

setopt auto_cd multios prompt_subst promptsubst
setopt auto_pushd pushd_ignore_dups pushdminus

autoload -Uz colors && colors

autoload -Uz select-word-style
select-word-style shell

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_COMPLETION_IGNORE='( |man |pikaur -S )*'

source ~/.dotfiles/aliases

# Homebrew install binaries is high priority
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
# Composer
if [[ -x "$(command -v composer)" ]]; then
    export PATH=$PATH:$HOME/.composer/vendor/bin
fi
# Yarn
if [[ -x "$(command -v yarn)" ]]; then
    export PATH=$PATH:`yarn global bin`
fi
# Golang
export GOPATH="$HOME/go"

### Load Zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit lucid for \
    zinit-zsh/z-a-bin-gem-node \
    OMZ::plugins/keychain/keychain.plugin.zsh

zinit wait lucid for \
    OMZ::lib/completion.zsh \
    OMZ::lib/git.zsh \
    OMZ::lib/history.zsh \
    OMZ::lib/key-bindings.zsh \
 atload"unalias grv g" \
    OMZ::plugins/git/git.plugin.zsh

zinit wait lucid for \
    skywind3000/z.lua \
    OMZ::plugins/asdf/asdf.plugin.zsh \
    OMZ::plugins/kubectl/kubectl.plugin.zsh \
    OMZ::plugins/helm/helm.plugin.zsh

zinit wait"2" lucid as"null" from"gh-r" for \
    mv"exa* -> exa" sbin   ogham/exa \
    mv"bat* -> bat" sbin"bat/bat" @sharkdp/bat

zinit as"completion" lucid
zinit snippet OMZ::plugins/docker/_docker

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf \
    zsh-users/zsh-completions

# Theme
zinit ice wait'!' lucid
zinit snippet 'https://github.com/killtw/dotfiles/blob/master/zsh/killtw.zsh-theme'
