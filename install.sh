#!/bin/bash
PWD=$(pwd)

case "$1" in
    atom)
        echo "Installing atom config"
        ln -s $PWD/atom/.atom ~/
        cp $PWD/atom/.atom/config.cson{.dist,}
        ;;
    bash)
        echo "Installing bash"
        ln -s $PWD/bash/.bash_profile ~/
        ln -s $PWD/bash/.bashrc ~/
        ;;
    git)
        echo "Installing git"
        bash git/install.sh
        bash git/configure_identity.sh
        bash git/configure_ux.sh
        bash git/configure_aliases.sh
        ;;
    mutt)
        echo "Installing mutt"
        ln -s $PWD/mutt/.muttrc ~/
        ;;
    osx)
        echo "Configuring some OSX settings"
        bash osx/configure.sh
        ;;
    tmux)
        echo "Installing tmux"
        ln -s $PWD/tmux/.tmux.conf ~/
        ;;
    vim)
        echo "Installing vim"
        ln -s $PWD/vim/.vimrc ~/
        mkdir -p ~/.vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
        ln -s $PWD/vim/.vim/ftplugin ~/.vim/ftplugin
        ;;
    zsh)
        echo "Installing zsh"
        mkdir ~/.antigen_install
        curl -L git.io/antigen > ~/.antigen_install/antigen.zsh
        ln -s $PWD/zsh/.zshrc ~/
        ln -s $PWD/zsh/.zsh_custom ~/
        ;;
    *)
        echo $"Unrecognized installable: $1"
        exit 1
esac
