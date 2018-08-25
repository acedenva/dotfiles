#!/bin/bash
#
if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi

cloud='/mnt/d/Cloud'
if [ -d ${cloud} ]; then
	rsync -r -u ${cloud}/crypt/unix/.ssh ${HOME}/
	ln -s ${cloud}/drive/scripts ${HOME}/scripts
	ln -s ${cloud}/crypt/unix/.secrets.bash ${HOME}/.secrets.bash
	chmod -R 500 ${HOME}/.ssh ${HOME}/scripts ${HOME}/.secrets.bash
fi

if [ ! -f ${HOME}/.secrets.bash ]; then
	# Template .secrets.bash -- maybe with sed
	# export S_userR=''
	# export S_portR=''
	# export S_serverR=''
	echo 'no .secrets.bash'	
fi


