# Lines configured by zsh-newuser-install
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt autocd extendedglob nomatch notify
setopt APPEND_HISTORY INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$XDG_COMFIG_HOME/zsh/.zshrc"

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
# End of lines added by compinstall

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="--layout=reverse --border"
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'batcat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'eza --tree {}'"

# load modules, if available
[[ -f $ZDOTDIR/aliases.zsh ]] && . $ZDOTDIR/aliases.zsh   

[[ -f $ZDOTDIR/prompt.zsh ]] && . $ZDOTDIR/prompt.zsh   

[[ -f $ZDOTDIR/plugins.zsh ]] && . $ZDOTDIR/plugins.zsh   

# load prompt
eval "$(starship init zsh)"
