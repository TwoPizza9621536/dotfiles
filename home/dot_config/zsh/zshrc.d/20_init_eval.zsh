#
# Commands that uses eval for initalization
#

# FZF
(( $+commands[fzf] )) && eval "$(fzf --zsh)"

# TheFuck
(( $+commands[thefuck] )) && eval "$(thefuck --alias)"

# Zoxide
(( $+commands[zoxide] )) && eval "$(zoxide init zsh --cmd cd)"
