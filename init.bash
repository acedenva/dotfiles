#!/bin/bash
#
# Todo:
# create .secrets.bash with init.bash script
# add removal option for my dotfiles with init.bash

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
		source ${HOME}/.secrets.bash
	fi
fi
if [ ! -f ${HOME}/.secrets.bash ]; then
	# Template .secrets.bash
	# export secret_myServer_user=''
	# export secret_myServer_server=''
	# export secret_myServer_port=''
	#
	# export secret_git_email=''
	#
	echo ''
	echo 'no .secrets.bash'	
fi
# xmodmap caps and ctrl swap with gnome autostart
if (type Xorg &> /dev/null); then
	mkdir -p ${HOME}/.config/autostart/
	echo "[Desktop Entry]
	Type=Application
	Exec=xmodmap ${HOME}/.xmodmap
	Hidden=false
	X-GNOME-Autostart-enabled=true
	Name=xmodmap
	Comment=xmodmap script">${HOME}/.config/autostart/xmodmap.desktop

	echo "!
	! Swap Caps_Lock and Control_L
	!
	remove Lock = Caps_Lock
	remove Control = Control_L
	keysym Control_L = Caps_Lock
	keysym Caps_Lock = Control_L
	add Lock = Caps_Lock
	add Control = Control_L">${HOME}/.xmodmap

	xmodmap ${HOME}/.xmodmap
fi


#Git
# change core editor to vim
git config --global core.editor "vim"
# set git credentials reminder
echo ' 
set your git credentials
git config --global user.email "Your Email"
git config --global user.name "Your Name"
'

