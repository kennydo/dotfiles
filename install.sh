#!/bin/bash

case "$1" in
    bash)
        echo "Installing bash"
        ln -s `readlink -f bash/.bash_profile` ~/
        ln -s `readlink -f bash/.bashrc` ~/
        ;;
    mutt)
        echo "Installing mutt"
        ln -s `readlink -f mutt/.muttrc` ~/
        ;;
    tmux)
        echo "Installing tmux"
        ln -s `readlink -f tmux/.tmux.conf` ~/
        ;;
    *)
        echo $"Unrecognized installable: $1"
        exit 1
esac
