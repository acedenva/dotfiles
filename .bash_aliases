if [ -f ${HOME}/.secrets.bash ]; then
	source ${HOME}/.secrets.bash
fi

if [ -f ${HOME}/.local/bin ]; then
	export PATH=${PATH}:${HOME}/.local/bin
fi

export GOOGLE_APPLICATION_CREDENTIALS=${HOME}/.ssh/mytts.json
 

alias gid="git --work-tree=${HOME} --git-dir=${HOME}/.dotfiles"
alias ssh-imko="ssh -i ${HOME}/.ssh/id_rsa -p ${Sec_portRef} ${Sec_userRef}@${Sec_serverRef}"
alias ssh-imko-steam="ssh -i ${HOME}/.ssh/id_rsa -p ${Sec_portRef} steam@${Sec_serverRef}"
alias sc="systemctl"
alias scdr="systemctl daemon-reload"
alias ns="netstat"
alias nstp="netstat -tulpen"
alias tmux-basic="\
	tmux new-session -d -s basic
	tmux split-window -t basic -h
	tmux attach -t basic"

stty -ixon
