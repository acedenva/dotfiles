#!/bin/bash
#
if [ ! -f ${HOME}/.secrets.bash ]; then
	# Template .secrets.bash -- maybe with sed
	# export S_userR=''
	# export S_portR=''
	# export S_serverR=''
fi

if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi
