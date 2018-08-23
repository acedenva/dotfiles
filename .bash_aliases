secrets=${HOME}/.secrets/bash_aliases
if [ -f ${secrets} ]; then
	source ${secrets}	
else
	rserver=''
	rport=''
	ruser=''
fi

alias ssh-refra="ssh -i ${HOME}/.ssh/id_rsa -p ${rport} ${ruser}@${rserver}"
alias ssh-refra:steam="ssh -i ${HOME}/.ssh/id_rsa -p ${rport} steam@${rserver}"
alias gid="git --work-tree=${HOME} --git-dir=${HOME}/dotfiles"
alias tmux-basic="\
	tmux new-session -d -s basic
	tmux split-window -t basic -h
	tmux attach -t basic"
