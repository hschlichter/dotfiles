setopt prompt_subst

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

bindkey -e

setopt autocd
setopt autopushd
setopt pushdignoredups

HISTSIZE=100000
SAVEHIST=100000
# setopt share_history
setopt append_history
setopt inc_append_history

autoload -Uz compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zmodload zsh/complist
compinit
_comp_options+=(globdots)

export KEYTIMEOUT=1
export CLICOLOR=1
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim

[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history --bind ctrl-n:down,ctrl-p:up --reverse"

eval $(/opt/homebrew/bin/brew shellenv)

# git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
# source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
