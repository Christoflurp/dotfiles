# initialize proper env stuff with brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="crunch"
plugins=(ruby rails git sudo)
setopt RM_STAR_SILENT

# Shopify default zshrc has some good stuff
if [ -n "$SPIN" ]; then
	source /etc/zsh/zshrc.default.inc.zsh
fi

# Initialize dev tool if it exists
if [ -d /opt/dev ]; then
  typeset __dev_source_dir="/opt/dev"
  source "${__dev_source_dir}/dev.sh"
fi

# Check if local or on spin for PROMPT
am_i_spun() {
	if [[ "${SPIN}" ]]; then
		echo "🌀"
	else
		echo "🏠"
	fi
}

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh

if [ ! -n "$SPIN" ]; then
	source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
fi

# Add local or spin stuff to prompt
PROMPT+="$(am_i_spun) -> "
