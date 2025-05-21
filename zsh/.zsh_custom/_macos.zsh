if [[ "$(uname)" == "Darwin" ]]; then
    if $(type /opt/homebrew/bin/brew &> /dev/null); then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

    # On darwin, oh-my-zsh aliases `ls` to `ls -G`, but `-G` means something different
    # when using coreutils `ls`.
    alias ls="ls --color=auto"

    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
fi
