# initialize proper env stuff with brew
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="fwalch"
plugins=(ruby rails git sudo)
setopt RM_STAR_SILENT

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
if [ -f /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
fi

# Update the prompt
PROMPT+='$(prompt_emoji) -> '
