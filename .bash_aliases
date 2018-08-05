export PATH="${PATH}:/mnt/c/Users/lobo/Seafile/drive/scripts/wow/luaparser/"
export PATH="${PATH}:/home/lobo/bin"
export PATH="${PATH}:/home/lobo/scripts/tools/"

alias gid="git --work-tree=${HOME} --git-dir=${HOME}/.dot"

alias tmux-basic="\
tmux new-session -d -s basic;\
tmux split-window -t basic -h;\
tmux attach -t basic"

source ${HOME}/.secrets
