if [[ -n "$WSL_DISTRO_NAME" ]]; then
    eval "$(keychain --eval --quiet --agents ssh id_rsa)"
fi
