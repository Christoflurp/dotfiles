#!/bin/bash

# Make sure oh-my-zsh is installed
[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

DOOT_DIR="$HOME/dev-stuff/dotfiles/doots"

# Setup Dotfiles
function setupDotfiles() {
  echo "Installing .gitconfig and .aliases for $1..."

  if [[ $1 == 'local' ]]; then
    gitConfigFile=".gitconfig.personal"
    aliasFile=".aliases.personal"
  else
    gitConfigFile=".gitconfig.work"
    aliasFile=".aliases.work"
  fi

  cp "$DOOT_DIR/$gitConfigFile" $HOME/".gitconfig"
  cp "$DOOT_DIR/$aliasFile" $HOME/".alises"

  if [[ -d $DOOT_DIR ]] && [[ ! -L $DOOT_DIR ]]; then
    for doot in $(ls -ap $DOOT_DIR | grep -v /); do
      dootname="$(basename "$doot")"
      if [[ $dootname =~ '.gitconfig' || $dootname =~ '.aliases' ]]; then
        continue
      fi

      echo "Installing $dootname..."
      target=~/"$dootname"
      [[ -f "$target" ]] && mv "$target" "$target.bak"
      cp "$DOOT_DIR/$dootname" $HOME/"$dootname"
    done
  else
    echo "Can't find directory: $DOOT_DIR."
  fi
}

# Personal or Work?
if [[ $(uname -m) == 'arm64' ]]; then
  setupDotfiles 'work'
else
  setupDotfiles 'local'
fi

exec zsh
