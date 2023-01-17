# initialize proper env stuff with brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="crunch"
plugins=(ruby rails git sudo dash)
setopt RM_STAR_SILENT

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

# Function to start a spin instance with preferred args

sup() {
	if [[ ! $1 ]]; then
		echo $1
		echo "You need to pass a repo/constellation name"
		echo "eg. shipify"
	else
		constellation=$1

		if [[ -n $2 ]]; then
			exec spin up $constellation --wait --name $2
			exit
		else
			exec spin up $constellation --wait
		fi
	fi
}

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

# Add local or spin stuff to prompt
PROMPT+="$(am_i_spun) -> "
