# Substitutions
alias cat=bat
alias cloc=scc
alias find=fd
alias grep=rg
alias neofetch=hyfetch

# General Aliases
alias mkdir="mkdir -p"
alias type="type -a"

alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias icat="kitty +kitten icat"
alias tb="toolbox enter"

# Load more specific 'run-help' function from $fpath
(( $+aliases[run-help] )) && unalias run-help && autoload -Uz run-help
alias help=run-help

eval $(thefuck --alias)
