# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="crunch"
plugins=(ruby rails git sudo)

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

# Aliases - Local
alias shipup="sh ~/dev-stuff/spin-init/shipify-secrets-decrypt.sh"
alias spk="bash ~/dev-stuff/output.sh"

# Aliases - Shopify Dev
alias dsa="dev style --include-branch-commits"

source $ZSH/oh-my-zsh.sh

# Add local or spin stuff to prompt
PROMPT+=" $(am_i_spun) -> "
