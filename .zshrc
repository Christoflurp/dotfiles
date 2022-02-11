# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Colours
autoload -U colors && colors

# Build Prompt

git_info() {
	local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"
	local branch_truncated="${branch:0:30}"
	local output=""
	if (( ${#branch} > ${#branch_truncated} )); then
		branch="${branch_truncated}..."
	fi
	if [ -z "$branch" ]; then
		output=""
	else
		output="$fg[red] | $fg[blue](${branch})"
	fi

	echo "${output}"
}

am_i_spun() {
	if [[ "${SPIN}" ]]; then
		echo "🌀"
	else
		echo "🏠"
	fi
}

# PROMPT='[%~] | [git_info] >>'
PROMPT='$(am_i_spun) $fg[green]%~$(git_info)$fg[green] -> $fg[white]'

s=(git ruby rails)

source $ZSH/oh-my-zsh.sh

