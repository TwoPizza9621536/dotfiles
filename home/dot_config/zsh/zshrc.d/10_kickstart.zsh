#
# kickstart.zsh: Load settings for zsh
# From https://github.com/mattmc3/zdotdir
#

#
# completion: Options and config related to completions.
#

# 16.2.2 Completion
setopt always_to_end     # Move cursor to the end of a completed word.
setopt auto_list         # Automatically list choices on ambiguous completion.
setopt auto_menu         # Show completion menu on a successive tab press.
setopt auto_param_slash  # If completed parameter is a directory, add a trailing slash.
setopt complete_in_word  # Complete from both ends of a word.
setopt NO_menu_complete  # Do not autoselect the first completion entry.

#
# directory: Set options and aliases related to Zsh directories and dirstack.
#

# 16.2.1 Changing Directories
setopt auto_pushd         # Make cd push the old directory onto the dirstack.
setopt pushd_minus        # Exchanges meanings of +/- when navigating the dirstack.
setopt pushd_silent       # Do not print the directory stack after pushd or popd.
setopt pushd_to_home      # Push to home directory when no argument is given.

# 16.2.3 Expansion and Globbing
setopt extended_glob      # Use more awesome globbing features.
setopt glob_dots          # Include dotfiles when globbing.

# 16.2.6 Input/Output
setopt path_dirs          # Perform path search even on command names with slashes.
setopt NO_clobber         # Don't overwrite files with >. Use >| to bypass.
setopt NO_rm_star_silent  # Ask for confirmation for `rm *' or `rm path/*'

# 16.2.9 Scripts and Functions
setopt multios        # Write to multiple descriptors.

#
# editor: Setup Zsh line editor behavior.
#

# 16.2.6 Input/Output
setopt interactive_comments    # Enable comments in interactive shell.
setopt rc_quotes               # Allow 'Hitchhikers''s Guide' instead of 'Hitchhikers'\''s Guide'.
setopt NO_flow_control         # Disable start/stop characters (usually ^Q/^S) in shell editor.

# 16.2.12 Zle
setopt combining_chars  # Combine 0-len chars with the base character (eg: accents).
setopt NO_beep          # Beep on error in line editor.

#
# history: Setup Zsh history.
#

# 16.2.4 History
setopt bang_hist               # Treat the '!' character specially during expansion.
setopt extended_history        # Write the history file in the ':start:elapsed;command' format.
setopt hist_expire_dups_first  # Expire a duplicate event first when trimming history.
setopt hist_find_no_dups       # Do not display a previously found event.
setopt hist_ignore_all_dups    # Delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_dups        # Do not record an event that was just recorded again.
setopt hist_ignore_space       # Do not record an event starting with a space.
setopt hist_reduce_blanks      # Remove extra blanks from commands added to the history list.
setopt hist_save_no_dups       # Do not write a duplicate event to the history file.
setopt hist_verify             # Do not execute immediately upon history expansion.
setopt inc_append_history      # Write to the history file immediately, not when the shell exits.
setopt NO_hist_beep            # Don't beep when accessing non-existent history.
setopt NO_share_history        # Don't share history between all sessions.

#
# jobs: Set options related to jobs.
#

# 16.2.7 Job Control
setopt auto_resume     # Attempt to resume existing job before creating a new process.
setopt long_list_jobs  # List jobs in the long format by default.
setopt notify          # Report status of background jobs immediately.
setopt NO_bg_nice      # Don't run all background jobs at a lower priority.
setopt NO_check_jobs   # Don't report on jobs when shell exit.
setopt NO_hup          # Don't kill jobs on shell exit.

#
# misc: Setup misc Zsh utils, common aliases, and other miscellany.
#

# Use built-in paste magic.
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Load more specific 'run-help' function from $fpath
(( $+aliases[run-help] )) && unalias run-help && autoload -Uz run-help
alias help=run-help

# Ensure open command exists.
if ! (( $+commands[open] )); then
  if [[ "$OSTYPE" == cygwin* ]]; then
    alias open='cygstart'
  elif [[ "$OSTYPE" == linux-android ]]; then
    alias open='termux-open'
  elif (( $+commands[xdg-open] )); then
    alias open='xdg-open'
  fi
fi

#
# prompt: Setup Zsh prompt.
#

# 16.2.8 Prompting
setopt prompt_subst       # Expand parameters in prompt variables.
setopt transient_rprompt  # Remove right prompt artifacts from prior commands.
