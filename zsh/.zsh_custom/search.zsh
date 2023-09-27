# Load fzf config first so that its Ctrl-R keybinding is overridden.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

local FOUND_ATUIN=$+commands[atuin]

if [[ $FOUND_ATUIN -eq 1 ]]; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi
