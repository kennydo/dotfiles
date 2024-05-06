#!/bin/bash

git config --global color.ui auto
git config --global core.editor vim
git config --global diff.compactionHeuristic true
git config --global fetch.prune true
git config --global init.defaultBranch main
git config --global merge.conflictstyle zdiff3
git config --global pull.ff only
git config --global push.default simple
git config --global push.autoSetupRemote true
