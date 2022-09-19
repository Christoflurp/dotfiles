# initialize proper env stuff with brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="crunch"
plugins=(ruby rails git sudo git-extras)
setopt RM_STAR_SILENT

# Shopify default zshrc has some good stuff
if [ -n "$SPIN" ]; then
	source /etc/zsh/zshrc.default.inc.zsh
else
	# This properly initializes a cached gpg key for gpg-agent on Spin
	echo "GPG gunna GPG" | /opt/dev/bin/gpg-auto-pin --clearsign > /dev/null
fi

# Check if local or on spin for PROMPT
am_i_spun() {
	if [[ "${SPIN}" ]]; then
		echo "🌀"
	else
		echo "🏠"
	fi
}

# gpg-agent stuff
GPG_TTY=$(tty)
export GPG_TTY

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh

# Add local or spin stuff to prompt
PROMPT+="$(am_i_spun) -> "
