if [[ "$(uname)" == "Darwin" ]]; then
    if $(type /opt/homebrew/bin/brew &> /dev/null); then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fi
