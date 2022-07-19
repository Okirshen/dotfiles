eval "$(starship init zsh)"

setopt autocd
unsetopt beep
# bindkey -v
zstyle :compinstall filename '/home/okirshen/.zshrc'

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
path+=~/.cargo/bin/

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE="${XDG_STATE_HOME}"/zsh/history

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

alias v="nvim"
alias yay="paru"
alias la="ls -A"
alias ls="ls --color=auto"

