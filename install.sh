#!/bin/bash

case "$1" in
    bash)
        echo "Installing bash"
        ln -s `readlink -f bash/.bash_profile` ~/
        ln -s `readlink -f bash/.bashrc` ~/
        ;;
    git)
        echo "Installing git"
        if [ -z "`git config --global user.name`" ]; then
            read -p "Name: " name
            git config --global user.name "$name"
        fi
        if [ -z "`git config --global user.email`" ]; then
            read -p "E-mail: " email
            git config --global user.email "$email"
        fi

        cp `readlink -f git/.gitignore_global` ~/

        git config --global core.editor "vim"
        git config --global core.excludesfile ~/.gitignore_global

        git config --global color.ui "auto"

        git config --global push.default "matching"

        git config --global alias.lg "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
        git config --global alias.lg2 "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)' --abbrev-commit"
        ;;
    mutt)
        echo "Installing mutt"
        ln -s `readlink -f mutt/.muttrc` ~/
        ;;
    tmux)
        echo "Installing tmux"
        ln -s `readlink -f tmux/.tmux.conf` ~/
        ;;
    vim)
        echo "Installing vim"
        ln -s `readlink -f vim/.vimrc` ~/
        mkdir -p ~/.vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
        ;;
    zsh)
        echo "Installing zsh"
        ln -s `readlink -f zsh/.zshrc` ~/
        ln -s `readlink -f zsh/.zsh_custom` ~/
        ;;
    *)
        echo $"Unrecognized installable: $1"
        exit 1
esac
