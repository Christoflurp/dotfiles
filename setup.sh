#!/usr/bin/env bash

clone_dir = `pwd`

## install oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## copy dootfills to root

ln -sf "${clone_dir}/.zshrc" "${HOME}/.zshrc"
ln -sf "${clone_dir}/.gitconfig" "${HOME}/.gitconfig"
cp "${clone_dir}/.vimrc" "${HOME}/.vimrc"

zsh
