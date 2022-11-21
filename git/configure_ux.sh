#!/bin/bash

git config --global init.defaultBranch main

git config --global core.editor "vim"

git config --global color.ui "auto"

git config --global fetch.prune "true"

git config --global push.default "simple"

git config --global diff.compactionHeuristic "true"

git config --global pull.ff "only"
