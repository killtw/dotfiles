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

source "$HOME/.dotfiles/aliases"

# Yarn
if [[ -x "$(command -v yarn)" ]]; then
    export PATH=$PATH:`yarn global bin`
fi
# Composer
if [[ -x "$(command -v composer)" ]]; then
    export PATH=$PATH:$HOME/.composer/vendor/bin
fi
# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
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
### Zinit loaded

zinit lucid for \
    zinit-zsh/z-a-bin-gem-node \
    OMZ::lib/completion.zsh \
    OMZ::lib/history.zsh \
    OMZ::lib/key-bindings.zsh

zinit lucid for \
    as"program" pick"keychain" funtoo/keychain \
    OMZ::plugins/keychain/keychain.plugin.zsh

zinit wait lucid for \
    skywind3000/z.lua

zinit wait"2" lucid as"null" from"gh-r" for \
    mv"bin/exa* -> exa" sbin"bin/exa" ogham/exa \
    mv"bat* -> bat" sbin"bat/bat" @sharkdp/bat

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
    zdharma/history-search-multi-word \
    @asdf-vm/asdf \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf \
    zsh-users/zsh-completions \
    OMZ::plugins/docker/_docker

# Theme
zinit wait'!' as"null" nocd lucid for \
 atload"!prompt_precmd" multisrc"{async,killtw}.zsh" \
    killtw/killtw.zsh
