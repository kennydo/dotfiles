if [[ -n "$__CFBundleIdentifier" ]]; then
    # Janky check to see we're on mac

    if $(type /opt/homebrew/bin/brew &> /dev/null); then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fi
