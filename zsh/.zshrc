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

# Composer
if [[ -x "$(command -v composer)" ]]; then
    export PATH=$PATH:$HOME/.composer/vendor/bin
fi
# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
# Golang
export GOPATH="$HOME/go"

### Load Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    command mkdir -p "$(dirname $ZINIT_HOME)"
    command git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### Zinit loaded

zinit lucid for \
    zdharma-continuum/zinit-annex-bin-gem-node \
    OMZL::completion.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh

zinit lucid for \
    as"program" pick"keychain" funtoo/keychain \
    OMZP::keychain \

zinit wait lucid for \
    skywind3000/z.lua \
    pack"binary" fzf \
    Aloxaf/fzf-tab

zinit wait"2" lucid as"null" from"gh-r" for \
    mv"bin/exa* -> exa" ogham/exa \
    mv"bat* -> bat" @sharkdp/bat

zinit wait"3" lucid for \
    OMZP::kubectl \
    as"program" from"gh" pick"(kubectx|kubens)" ahmetb/kubectx

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
    zdharma-continuum/history-search-multi-word \
    @asdf-vm/asdf \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf \
    zsh-users/zsh-completions \
    OMZP::docker/_docker

# Theme
zinit wait'!' as"null" nocd lucid for \
 atload"!prompt_precmd" multisrc"{async,killtw}.zsh" \
    killtw/killtw.zsh
