#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf $DIR/.gitignore_global ~/

git config --global core.excludesfile ~/.gitignore_global

ln -sf $DIR/.git_commands ~/
