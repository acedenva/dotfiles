#Secrets
if [ -f ${HOME}/.secrets.bash ]; then
	source ${HOME}/.secrets.bash
fi

#Local Bin Path
if [ -f ${HOME}/.local/bin ]; then
	export PATH=${PATH}:${HOME}/.local/bin
fi
 
#Aliases
alias gid="git --work-tree=${HOME} --git-dir=${HOME}/.dotfiles"
alias ssh-imko="ssh -i ${HOME}/.ssh/id_rsa -p ${Sec_portRef} ${Sec_userRef}@${Sec_serverRef}"
alias ssh-imko-rust="ssh -i ${HOME}/.ssh/id_rsa -p ${Sec_portRef} rust@${Sec_serverRef}"
alias sc="systemctl"
alias scdr="systemctl daemon-reload"
alias ns="netstat"
alias nstp="netstat -tulpen"
alias tmux-basic="\
	tmux new-session -d -s basic
	tmux split-window -t basic -h
	tmux attach -t basic"

stty -ixon
