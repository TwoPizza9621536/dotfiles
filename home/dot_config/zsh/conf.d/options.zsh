# Zsh options
unsetopt BEEP
unsetopt HIST_BEEP

# Enable comments and corrections in interative shells
setopt CORRECT_ALL
setopt INTERACTIVE_COMMENTS

# Automaticly change and push directory path to the stack
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

# You Should Use
YSU_HARDCORE=1
YSU_MESSAGE_FORMAT="💡 %alias_type Tip: %alias"
YSU_MESSAGE_POSITION=after
