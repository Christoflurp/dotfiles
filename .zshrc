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
	if (( ${#branch} > ${#branch_truncated} )); then
		branch="${branch_truncated}..."
	fi

	[ -n "${branch}" ] && echo " (${branch})"
}

am_i_spun() {
	if [[ "${SPIN}" ]]; then
		echo "SPIN"
	else
		echo "LOCAL"
	fi
}

setopt PROIMPT_SUBST
PROMPT="[%d] | [$(git_info)]\n\t$ >>"

s=(git ruby rails)

source $ZSH/oh-my-zsh.sh

