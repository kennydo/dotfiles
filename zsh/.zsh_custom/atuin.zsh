local FOUND_ATUIN=$+commands[atuin]

if [[ $FOUND_ATUIN -eq 1 ]]; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi
