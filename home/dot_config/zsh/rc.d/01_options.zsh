# Enable comments and corrections in interative shells
setopt correctall
setopt interactivecomments

# Automaticly change and push directory path to the stack
setopt autocd
setopt autopushd
setopt pushdignoredups
setopt pushdminus

# FZF-Tab common config
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with ls when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# Autopairs
typeset -gA AUTOPAIR_PAIRS
AUTOPAIR_PAIRS+=("<" ">")

# Syntax Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)

# Autosuggest
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# You Should Use
export YSU_HARDCORE=1
export YSU_MESSAGE_FORMAT="%alias_type Tip: %alias"
export YSU_MESSAGE_POSITION=after

# FZF
export FZF_DEFAULT_COMMAND="$FZF_DEFAULT_COMMAND --preview 'cat --style=numbers --color=always --line-range :500 {}'"
