#!/bin/bash

git config --global alias.lg 'log --graph --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)" --abbrev-commit --date=relative'
git config --global alias.lg2 'log --graph --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)" --abbrev-commit'

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# I want to avoid using "--force"
git config --global alias.pof 'push origin --force-with-lease'

git config --global alias.rom 'rebase origin/master'

#
# Configure git workflow-y aliases
#

# Not useful by itself, but is used by several aliases
git config --global alias.branch-name '!git rev-parse --abbrev-ref HEAD'

# Set the upstream so that the "pof" alias works
git config --global alias.publish '!git push -u origin $(git branch-name)'

# Remove branches that have been merged upstream
git config --global alias.cleanup-merged-branches '!git branch --merged | grep -v "\\*\\|master\\|release" | xargs -n 1 git branch -d'

# Use this before starting a new feature branch to make sure I'm up to date
git config --global alias.cleanup-local-repo '!git checkout master ; git fetch -p ; git merge origin/master ; git cleanup-merged-branches'

# Compare this branch to its merge base
git config --global alias.diff-merge-base '!f() { git diff $(git merge-base $1 $(git branch-name))..$(git branch-name); }; f'
