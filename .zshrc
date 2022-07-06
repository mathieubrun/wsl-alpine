export PATH="$HOME/go/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export HISTORY_IGNORE="(..|cd|cd *|glola|gst|gd|k9s|ll|lla|reboot)"

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autopushd

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
compinit
complete -C aws_completer aws

source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle docker
antigen bundle fzf
antigen bundle git
antigen bundle helm
antigen bundle kubectl
antigen bundle minikube
antigen bundle terraform

antigen bundle Tarrasch/zsh-autoenv
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
FZF_CTRL_T_COMMAND="fdfind . $HOME"
FZF_ALT_C_COMMAND="fdfind -t d . $HOME"
FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

alias ls='exa --group-directories-first'
alias ll='ls -l'
alias lla='ll -a'

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[[ -f ~/.private.zsh ]] && source ~/.private.zsh

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need .url-quote-magic?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish