setopt prompt_subst

autoload -U colors && colors

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

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history --bind ctrl-n:down,ctrl-p:up --reverse --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

eval $(/opt/homebrew/bin/brew shellenv)

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
