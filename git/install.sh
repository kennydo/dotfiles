#!/bin/sh

if [ -z "`git config --global user.name`" ]; then
    read -p "Name: " name
    git config --global user.name "$name"
fi
if [ -z "`git config --global user.email`" ]; then
    read -p "E-mail: " email
    git config --global user.email "$email"
fi

cp .gitignore_global ~/

git config --global core.editor "vim"
git config --global core.excludesfile ~/.gitignore_global

git config --global color.ui "auto"

git config --global push.default "matching"

git config --global alias.lg "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
git config --global alias.lg2 "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)' --abbrev-commit"
