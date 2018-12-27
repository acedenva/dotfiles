if [ -f ${HOME}/.secrets.bash ]; then
	source ${HOME}/.secrets.bash
fi

alias ssh-refra="ssh -i ${HOME}/.ssh/id_rsa -p ${Sec_portRef} ${Sec_userRef}@${Sec_serverRef}"
alias ssh-refra-steam="ssh -i ${HOME}/.ssh/id_rsa -p ${Sec_portRef} steam@${Sec_serverRef}"
alias gid="git --work-tree=${HOME} --git-dir=${HOME}/dotfiles"
alias tmux-basic="\
	tmux new-session -d -s basic
	tmux split-window -t basic -h
	tmux attach -t basic"


export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox
#stty -ixon
