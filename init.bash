#!/bin/bash
#
if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi
repos='/mnt/c/Users/lobo/repos'
if [ -d ${repos} ]; then
	ln -s ${repos} ${HOME}
fi

cloud='/mnt/d/Cloud'
if [ -d ${cloud} ]; then
	rsync -r -u ${cloud}/crypt/unix/.ssh ${HOME}/
	ln -s ${cloud}/crypt/unix/.secrets.bash ${HOME}/.secrets.bash
	ln -s ${cloud}/drive/scripts ${HOME}/scripts
	chmod -R 500 ${HOME}/.ssh ${HOME}/.secrets.bash
	chmod -R 770 ${HOME}/scripts 
fi

if [ ! -f ${HOME}/.secrets.bash ]; then
	# Template .secrets.bash -- maybe with sed
	# export S_userR=''
	# export S_portR=''
	# export S_serverR=''
	echo 'no .secrets.bash'	
fi
echo "reload .bash_aliases"