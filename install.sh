#!/bin/bash
PWD=$(pwd)

case "$1" in
    atom)
        echo "Installing atom config"
        ln -s $PWD/atom/.atom ~/
        cp $PWD/atom/.atom/config.cson{.dist,}
        apm install --packages-file atom/package_list.txt
        ;;
    bash)
        echo "Installing bash"
        ln -s $PWD/bash/.bash_profile ~/
        ln -s $PWD/bash/.bashrc ~/
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

        ln -s $PWD/git/.gitignore_global ~/

        git config --global core.editor "vim"
        git config --global core.excludesfile ~/.gitignore_global

        git config --global color.ui "auto"

        git config --global push.default "simple"

        git config --global alias.lg "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
        git config --global alias.lg2 "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)' --abbrev-commit"
        git config --global alias.cleanup-merged-branches "!git branch --merged | grep -v '\\*\\|master\\|release' | xargs -n 1 git branch -d"
        git config --global alias.co checkout
        git config --global alias.br branch
        git config --global alias.ci commit
        git config --global alias.st status
        ;;
    mutt)
        echo "Installing mutt"
        ln -s $PWD/mutt/.muttrc ~/
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
        ;;
    zsh)
        echo "Installing zsh"
        ln -s $PWD/zsh/.zshrc ~/
        ln -s $PWD/zsh/.zsh_custom ~/
        git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        ;;
    *)
        echo $"Unrecognized installable: $1"
        exit 1
esac
