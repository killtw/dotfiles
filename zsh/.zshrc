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
export PHP_CS_FIXER_IGNORE_ENV=1
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
    from'gh-r' sbin'fzf' junegunn/fzf \
    Aloxaf/fzf-tab \
    https://github.com/junegunn/fzf/raw/master/shell/{'completion','key-bindings'}.zsh

zinit wait"2" lucid as"program" from"gh-r" for \
    atclone"cp -vf completions/exa.zsh _exa" sbin"**/exa -> exa" ogham/exa \
    sbin"**/bat -> bat" @sharkdp/bat \
    sbin"jq* -> jq" stedolan/jq

zinit wait"3" lucid has"kubectl" for \
    OMZP::kubectl \
    as"program" id-as"kubectl-completion" atclone"kubectl completion zsh > _kubectl" atpull"%atclone" zdharma-continuum/null \
    as"program" id-as"helm-completion" atclone"helm completion zsh > _helm" atpull"%atclone" zdharma-continuum/null \
    as"program" from"gh" pick"(kubectx|kubens)" ahmetb/kubectx

zinit wait"3" lucid has"nerdctl" for \
    as"program" id-as"nerdctl-completion" atclone"nerdctl completion zsh > _nerdctl" atpull"%atclone" zdharma-continuum/null

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
    zdharma-continuum/history-search-multi-word \
    @asdf-vm/asdf \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
    OMZP::docker/_docker

# Theme
#zinit wait'!' as"null" nocd lucid for \
#    atload"!prompt_precmd" multisrc"{async,killtw}.zsh" killtw/killtw.zsh
zinit wait"!" as"command" from"gh-r" lucid for \
    atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" atpull"%atclone" src"init.zsh" starship/starship
