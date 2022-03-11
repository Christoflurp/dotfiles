#!/bin/bash

if [[ -n $SPIN ]]; then
  DOOT_DIR="$HOME/dotfiles"
else
  DOOT_DIR="$HOME/dev-stuff/dotfiles/doots"
fi

if [[ -d $DOOT_DIR ]] && [[ ! -L $DOOT_DIR ]]; then
  for doot in $(ls -ap $DOOT_DIR | grep -v /); do
    dootname="$(basename "$doot")"
    echo "Installing $dootname..."
    target=~/"$dootname"
    [[ -f "$target" ]] && mv "$target" "$target.bak"
    cp "$DOOT_DIR/$dootname" $HOME/"$dootname"
  done
else
  echo "Can't find directory: $DOOT_DIR."
fi

zsh