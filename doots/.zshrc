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

# shadowenv shell hook — activates zone environment on cd (enables dev server, dev schema-versioning, etc.)
if command -v shadowenv &>/dev/null; then
  eval "$(shadowenv init zsh)"
fi

# Are you in a work directory? In a world worktree, show which tree you're on.
prompt_emoji() {
	if [[ "$PWD" == */world/trees/* ]]; then
		local tree="${PWD#*/world/trees/}"
		tree="${tree%%/*}"
		if [[ "$tree" == "root" ]]; then
			echo "⚓"
		else
			echo "🌲"
		fi
		return
	fi
	case "$PWD" in
		*shopify*) echo "🏢";;
		*world*) echo "🏢";;
		*) echo "🏠";;
	esac
}

# Show the world worktree name (e.g. [root], [whatever-comes-up]) in magenta.
prompt_worktree() {
	if [[ "$PWD" == */world/trees/* ]]; then
		local tree="${PWD#*/world/trees/}"
		tree="${tree%%/*}"
		echo " %{$fg[magenta]%}[$tree]%{$reset_color%}"
	fi
}

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
if [ -f /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
fi

# Update the prompt: shopify [worktree] (branch) <emoji> ->
PROMPT='%{$fg_bold[green]%} %{$fg[cyan]%}%c$(prompt_worktree)%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}$(prompt_emoji) -> '


# Added by tec agent
[[ -x /Users/christoflurp/.local/state/tec/profiles/base/current/global/init ]] && eval "$(/Users/christoflurp/.local/state/tec/profiles/base/current/global/init zsh)"
