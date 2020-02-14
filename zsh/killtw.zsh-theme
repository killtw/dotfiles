#Color Shortcuts
R=$fg[red]
G=$fg[green]
B=$fg[blue]
Y=$fg[yellow]
RB=$fg_blod[red]
GB=$fg_blod[green]
YB=$fg_blod[yellow]
RESET=$reset_color

#PREFIX
PROMPT='[%{$B%}%n%{$Y%}@%{$R%}%m%{$RESET%}] %{$fg[cyan]%}%1~ %{$RESET%}$(git_prompt_info)%% %b%{$RESET%}'

RPROMPT='[%{$G%}%T%f]%{$RESET%}'

#Git Colors
ZSH_THEME_GIT_PROMPT_PREFIX="%{$B%}<%{$R%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$RESET%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$R%}%B✘%{$B%}> "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$G%}✔%{$B%}> "

ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[red]%}%"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}*"
