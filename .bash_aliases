if [ -f ${HOME}/.secrets.bash ]; then
	source ${HOME}/.secrets.bash
fi

alias ssh-refra="ssh -i ${HOME}/.ssh/id_rsa -p ${S_portR} ${S_userR}@${S_serverR}"
alias ssh-refra:steam="ssh -i ${HOME}/.ssh/id_rsa -p ${S_portR} steam@${S_serverR}"
alias gid="git --work-tree=${HOME} --git-dir=${HOME}/dotfiles"
alias tmux-basic="\
	tmux new-session -d -s basic
	tmux split-window -t basic -h
	tmux attach -t basic"
