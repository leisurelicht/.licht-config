#!/usr/bin/env bash

install_path=$(
	cd $(dirname $0)
	pwd
)

config_path=$(
	cd $install_path/..
	pwd
)

echo "====> Config file root path is: ${config_path}"

tmux_need_install=0
git_need_install=0

if ! command -v tmux >/dev/null 2>&1; then
	echo "====> Command [tmux] is not be installed."
	tmux_need_install=1
fi

if ! command -v git >/dev/null 2>&1; then
	echo "====> Command [git] is not be installed."
	git_need_install=1
fi

if [[ $(uname -s) == 'Darwin' ]]; then
	if ! command -v brew >/dev/null 2>&1; then
		echo "====> Command [brew] is not be installed, Start To install."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "====> Commnad [brew] is already installed"
	fi

	if [[ ${tmux_need_install} == 1 ]]; then
		echo "====> Install Command [tmux]."
		brew install tmux
		tmux_need_install=0
	fi
	if [[ ${git_need_install} == 1 ]]; then
		echo "====> Install Command [git]."
		brew install git
		git_need_install=0
	fi
elif [[ $(uname -s) == 'Linux' ]]; then
	os=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
	if [[ ${os} == "ubuntu" ]]; then
		if [[ ${tmux_need_install} == 1 ]]; then
			echo "====> Install Command [tmux]."
			sudo apt-get install tmux -y
			tmux_need_install=0
		fi
		if [[ ${git_need_install} == 1 ]]; then
			echo "====> Install Command [git]."
			sudo apt-get install git -y
			git_need_install=0
		fi
	elif [[ ${os} == "centos" ]]; then
		if [[ ${tmux_need_install} == 1 ]]; then
			echo "====> Install Command [tmux]."
			sudo yum install tmux -y
			tmux_need_install=0
		fi
		if [[ ${git_need_install} == 1 ]]; then
			echo "====> Install Command [git]."
			sudo yum install git -y
			git_need_install=0
		fi
	fi
fi

if [[ ${tmux_need_install} == 1 ]] ||
	[[ ${git_need_install} == 1 ]]; then
	echo "====> Need Install Command [tmux] And [git] First"
	exit 1
fi

# tpm
echo "====> Install tumx plugins manage plugin tpm"
if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	if [ $? -ne 0 ]; then
		rm -r ~/.tmux/plugins/tpm >/dev/null 2>&1
		echo "xxxx> Download tpm failed, install stop"
		exit 1
	else
		echo "====> Download tpm Succeed"
	fi
fi

# backup
echo "====> Backup dir path is: ${config_path}/bak"
if [ ! -d $config_path/bak ]; then
	mkdir -p $config_path/bak
fi

if [ -f ~/.tmux.conf ]; then
	echo "====> Tmux config file [tmux.conf] is exist, backup and delete it."
	mv ~/.tmux.conf $config_path/bak/tmux.conf.bak
	rm ~/.tmux.conf >/dev/null 2>&1
fi

# link file
echo "====> Create tmux.conf link"
ln -s $config_path/tmux/tmux.conf ~/.tmux.conf
