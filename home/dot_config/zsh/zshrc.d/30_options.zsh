# Autopairs
typeset -gA AUTOPAIR_PAIRS
AUTOPAIR_PAIRS+=("<" ">")

# Autosuggestions
typeset -ga ZSH_AUTOSUGGEST_STRATEGY
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
