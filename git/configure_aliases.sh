#!/bin/bash

git config --global alias.lg "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
git config --global alias.lg2 "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)' --abbrev-commit"

git config --global alias.cleanup-merged-branches "!git branch --merged | grep -v '\\*\\|master\\|release' | xargs -n 1 git branch -d"

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global alias.pof "push origin --force-with-lease"

git config --global alias.cleanup-local-repo "!git checkout master ; git fetch -p ; git merge origin/master ; git cleanup-merged-branches"
