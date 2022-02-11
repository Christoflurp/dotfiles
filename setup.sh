#!/usr/bin/env bash

clone_dir = `pwd`

## install oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## copy dootfills to root

ln -fs "${clone_dir}/.zshrc" "${HOME}/.zshrc"
# ln -fs "${clone_dir}/.gitconfig" "${HOME}/.gitconfig"
cp "${clone_dir}/.vimrc" "${HOME}/.vimrc"

zsh
