#!/bin/bash
#
if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi
# creating symlinks in home for WSL+Seafile  
if [[ -x $(which powershell.exe) ]]; then
	winuser=$(powershell.exe -Command '[ENVIRONMENT]::GetEnvironmentVariable("Username")'\
		| sed -r 's/\s+//g')
	hostname=$(powershell.exe -Command '[ENVIRONMENT]::GetEnvironmentVariable("Computername")'\
		| sed -r 's/\s+//g')
	sdrive="/mnt/c/Users/${winuser}/Seafile/sdrive"
	rchive="/mnt/c/Users/${winuser}/Seafile/rchive"
	if [[ -d ${sdrive} ]]; then
		if [[ ! -d ${sdrive}/keys/${hostname} ]]; then
			mkdir -p ${sdrive}/keys/${hostname}
		fi
		rsync -rutv ${HOME}/.ssh ${sdrive}/keys/${hostname}/
		rsync -rutv ${sdrive}/keys/${hostname}/.ssh ${HOME}/
		ln -s ${sdrive}/keys/.secrets.bash ${HOME}/.secrets.bash
		chmod -R 700 ${HOME}/.ssh ${HOME}/.secrets.bash
	fi
fi
if [ ! -f ${HOME}/.secrets.bash ]; then
	# Template .secrets.bash -- maybe with sed
	# export S_userR=''
	# export S_portR=''
	# export S_serverR=''
	echo 'no .secrets.bash'	
fi
echo "reload .bash_aliases"
