# Run neofetch
hyfetch

# Instant Prompt
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Load ASDF
if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
  source $ASDF_DIR/asdf.sh

  if [[ -f "$ASDF_DIR/plugins/java/set-java-home.zsh" ]]; then
    source $ASDF_DIR/plugins/java/set-java-home.zsh
  fi

  if [[ -f "$ASDF_DIR/plugins/dotnet-core/set-dotnet-home.zsh" ]]; then
    source $ASDF_DIR/plugins/dotnet-core/set-dotnet-home.zsh
  fi
fi
