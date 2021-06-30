export WORKON_HOME=$HOME/.virtualenvs

export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

