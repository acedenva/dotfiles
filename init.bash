#!/bin/bash
#
# Todo:
# create .secrets.bash with init.bash script
# add removal option for my dotfiles with init.bash

if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi
# creating symlinks in home on Windows & WSL environment and installed & synced seafile client
if [[ -x $(which powershell.exe) ]]; then
	winuser=$(powershell.exe -Command '[ENVIRONMENT]::GetEnvironmentVariable("Username")'\
		| sed -r 's/\s+//g')
	hostname=$(powershell.exe -Command '[ENVIRONMENT]::GetEnvironmentVariable("Computername")'\
		| sed -r 's/\s+//g')
	sdrive="/mnt/c/Users/${winuser}/Seafile/sdrive"
	if [[ -d ${sdrive} ]]; then
		if [[ ! -d ${sdrive}/keys/${hostname} ]]; then
			mkdir -p ${sdrive}/keys/${hostname}
		fi
		rsync -rutv ${HOME}/.ssh ${sdrive}/keys/${hostname}/
		rsync -rutv ${sdrive}/keys/${hostname}/.ssh ${HOME}/
		if [[ -f ${sdrive}/keys/.secrets.bash ]]; then
			source ${HOME}/.secrets.bash
			# set git credentials
			git config --global user.email "${secrets_git_email}"
			git config --global user.name "${secrets_git_user}"
		else
			#create empty secrets.bash
			echo "export secrets_myServer_user=''" >> ${sdrive}/keys/.secrets.bash
			echo "export secrets_myServer_address=''" >> ${sdrive}/keys/.secrets.bash
			echo "export secrets_myServer_port=''" >> ${sdrive}/keys/.secrets.bash
			echo "export secrets_git_email=''" >> ${sdrive}/keys/.secrets.bash
			echo "export secrets_git_user=''" >> ${sdrive}/keys/.secrets.bash
			echo ''
			echo 'empty .secrets.bash created in sdrive/keys/'	
		fi
		ln -s ${sdrive}/keys/.secrets.bash ${HOME}/.secrets.bash
		chmod -R 700 ${HOME}/.ssh ${HOME}/.secrets.bash
	else
		echo 'set your git credentials'
		echo 'git config --global user.email "Your Email"'
		echo 'git config --global user.name "Your Name"'
	fi
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
git config --global credential.helper store
