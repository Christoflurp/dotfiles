#!/bin/bash
set -eo pipefail
IFS=$'\n\t'

# oh-my-zsh setup
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="aussiegeek"

# Shopify default zshrc has some good stuff
if [ -n "$SPIN" ]; then
	source /etc/zsh/zshrc.default.inc.zsh
fi

# Check if local or on spin for PROMPT
am_i_spun() {
	if [[ "${SPIN}" ]]; then
		echo "🌀"
	else
		echo "🏠"
	fi
}

# Aliases
alias g="git"
alias shipup="sh ~/dev-stuff/spin-init/shipify-secrets-decrypt.sh"
alias spk="bash ~/dev-stuff/output.sh"

source $ZSH/oh-my-zsh.sh

# Add local or spin stuff to prompt
PROMPT+=' $(am_i_spun) -> '