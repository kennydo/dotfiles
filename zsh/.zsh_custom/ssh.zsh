fix-ssh() {
    eval $(tmux showenv -s SSH_AUTH_SOCK)
}

