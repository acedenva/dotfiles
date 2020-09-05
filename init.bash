#!/bin/bash
#
if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi
# creating symlinks in home for WSL+Seafile  
if [[ -x $(which powershell.exe) ]]; then
	winuser=$(powershell.exe -Command '[ENVIRONMENT]::GetEnvironmentVariable("Username")' | sed -r 's/(([a-z]|[0-9])+)/\1/ig')
	hostname=$(powershell.exe -Command '[ENVIRONMENT]::GetEnvironmentVariable("Computername")' | sed -r s/\n//g)
	echo ${winuser}
	sdrive="/mnt/c/Users/${winuser}/Seafile/sdrive"
	###rchive="/mnt/c/Users/${winuser}/Seafile/rchive"

	echo ${sdrive}
	if [[ -d ${sdrive} ]]; then
		echo ${drive}
		exit
		rsync -rutv ${sdrive}/unix/.ssh ${HOME}/
		rsync -rutv ${HOME}/.ssh ${sdrive}/unix/
		ln -s ${sdrive}/unix/.secrets.bash ${HOME}/.secrets.bash
		ln -s ${sdrive}/drive/scripts ${HOME}/scripts
		chmod -R 700 ${HOME}/.ssh ${HOME}/.secrets.bash
		chmod -R 770 ${HOME}/scripts 
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
