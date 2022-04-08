#!/bin/bash

# Make sure oh-my-zsh is installed
[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set $DOOT_DIR based on where local or on Spin
if [[ -n $SPIN ]]; then
  DOOT_DIR="$HOME/dotfiles/doots"
else
  DOOT_DIR="$HOME/dev-stuff/dotfiles/doots"
fi

# Copy dotfiles to the right place based on $DOOT_DIR
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

exec zsh
