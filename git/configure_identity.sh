#!/usr/bin/bash

if [ -z "`git config --global user.name`" ]; then
    read -p "Name: " name
    git config --global user.name "$name"
fi
if [ -z "`git config --global user.email`" ]; then
    read -p "E-mail: " email
    git config --global user.email "$email"
fi
