# initialize proper env stuff with brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="fwalch"
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

# Are you in a work directory?
prompt_emoji() {
	case "$PWD" in
		*shopify*) echo "🏢";;
		*world*) echo "🏢";;
		*) echo "🏠";;
	esac
}

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

# Update the prompt
PROMPT+='$(prompt_emoji) -> '
