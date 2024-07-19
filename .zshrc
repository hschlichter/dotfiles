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

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$WASMTIME_HOME/bin:$PATH"

export KEYTIMEOUT=1
export CLICOLOR=1
export EDITOR=nvim
export VISUAL=nvim
export WASMTIME_HOME="$HOME/.wasmtime"

[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history --bind ctrl-n:down,ctrl-p:up --reverse --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

function fzf_find_process() {
    (date; ps -ef) | fzf --bind='ctrl-r:reload(date; ps -ef)' \
        --header=$'Press CTRL-R to reload\n\n' --header-lines=2 \
        --preview='echo {}' --preview-window=down,3,wrap \
        --layout=reverse --height=40% | awk '{print $2}'
}

zle -N fzf_find_process

alias findprocess='fzf_find_process'
alias fp='findprocess'

function rg_fzf_search() {
    local ext=""
    local query=""

    local help_message="Usage: search [options] [query]
Options:
-e, --extension EXT    Search only files with the specified extension (e.g., rs, txt).
-h, --help             Show this help message and exit.

Examples:
    search 'your query'
    search -e rs 'your query'
    search --extension txt 'another query'"
    
    if [[ $# -eq 0 ]]; then
        echo "$help_message"
        return 0
    fi

    while [[ $# -gt 0 ]]; do
        case $1 in
            -e|--extension)
                ext="$2"
                shift 2
                ;;
            -h|--help)
                echo "$help_message"
                return 0
                ;;
            *)
                query="$query $1"
                shift
                ;;
        esac
    done

    query="${query#"${query%%[![:space:]]*}"}"
    query="${query%"${query##*[![:space:]]}"}"

    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case"

    if [[ -n "$ext" ]]; then
        RG_PREFIX="$RG_PREFIX --glob '*.$ext'"
    fi

    selected_files=$(fzf --ansi --multi --disabled --query "$query" \
        --bind "start:reload:if [[ -n {q} ]]; then $RG_PREFIX {q}; fi" \
        --bind "change:reload:sleep 0.1; if [[ -n {q} ]]; then $RG_PREFIX {q}; fi || true" \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3')
        --bind 'enter:become(nvim {1} +{2})'

    if [[ -n "$selected_files" ]]; then
        echo "Selected files:"
        echo "$selected_files"

        first_command=""
        vsplit_commands=""
        first_file=1

        while IFS= read -r line; do
            file=$(echo "$line" | awk -F: '{print $1}')
            line_number=$(echo "$line" | awk -F: '{print $2}')

            if [[ $first_file -eq 1 ]]; then
                first_command="edit +$line_number $file"
                first_file=0
            else
                vsplit_commands+=" -c 'vsplit +$line_number $file'"
            fi
        done <<< "$selected_files"

        nvim_command="nvim -c '$first_command' $vsplit_commands"
        eval "$nvim_command"
    fi
}

zle -N rg_fzf_search

# bindkey '^G' rg_fzf_search
alias search='rg_fzf_search'
alias s='search'


eval $(/opt/homebrew/bin/brew shellenv)

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
