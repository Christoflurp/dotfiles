
# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

alias vi="vim"


source ~/git-completion.bash
source ~/Dev/scripts/bash-launch.sh

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/chrissweeney/.kube/config:/Users/chrissweeney/.kube/config.shopify.cloudplatform
for file in /Users/chrissweeney/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases
alias config='/usr/bin/git --git-dir=/Users/chrissweeney/.cfg/ --work-tree=/Users/chrissweeney'
