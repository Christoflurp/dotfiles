#!/usr/bin/env bash

export VISUAL=vim
export EDITOR="$VISUAL"

clone_dir = `pwd`

## install oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## copy dootfills to root

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc

