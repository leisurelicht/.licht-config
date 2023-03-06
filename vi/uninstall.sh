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

if [[ ${1} == "" || ${1} == "vim" ]]; then
	if [ -h ~/.vimrc ]; then
		echo '====> Uninstall vim'
	else
		echo '====> No vim'
		exit 0
	fi

	echo '====> Remove vimrc'
	rm ~/.vimrc >/dev/null 2>&1

	echo '====> move vimrc file back'
	mv $config_path/bak/vimrc.bak ~/.vimrc
fi

if [[ ${1} == "" || ${1} == "nvim" ]]; then
	if [ -h ~/.config/nvim/init.vim ]; then
		echo '====> Uninstall nvim'
	else
		echo '====> No nvim'
		exit 0
	fi

	echo '====> Remove nvim'
	rm -r ~/.config/nvim >/dev/null 2>&1

	echo '====> move nvim folder back'
	mv $config_path/bak/nvim_bak ~/.config/nvim >/dev/null 2>&1
fi
