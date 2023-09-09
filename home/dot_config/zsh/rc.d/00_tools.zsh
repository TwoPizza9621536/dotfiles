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
