setopt prompt_subst

# Enable colors and change prompt:
autoload -U colors && colors

# Git branch prompt
autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd update_branch_name
function update_branch_name() {
    branch_name=$(git branch --show-current 2> /dev/null)
}
add-zsh-hook precmd update_prompt
function update_prompt() {
    PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%} ${branch_name}
$%b "
}

CASE_SENSITIVE="false"

bindkey -e

setopt autocd
setopt autopushd
setopt pushdignoredups

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt append_history
setopt inc_append_history

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# fp - find process
fp() {
    ps -ef | fzf
 }

# fk - find process to kill
fk() {
    ps -ef | fzf | awk {'print $2'} | xargs kill -9
}

export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"

export CLICOLOR=1
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export EDITOR=vim
export VISUAL=vim

eval $(/opt/homebrew/bin/brew shellenv)

export NVM_DIR="/Users/henrikschlichter/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
