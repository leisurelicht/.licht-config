#!/usr/bin/env bash

# 判断第一个命令行参数是否为 vim 或 neovim
if [[ "${1}" == "vim" || "${1}" == "neovim" ]]; then
	echo "====> Start to install ${1} config file."
else
	echo "====> Error: Unknown parameter: ${1}"
	echo "====> Usage: ./uninstall.sh [vim|neovim]"
	exit 1
fi


install_path=$(
	cd "$(dirname "${0}")" || exit
	pwd
)
config_path=$(
	cd "${install_path}/.." || exit
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
	mv "${config_path}"/bak/vimrc.bak ~/.vimrc
fi

if [[ ${1} == "" || ${1} == "neovim" ]]; then
	if [ -h ~/.config/nvim ]; then
		echo '====> Uninstall nvim'
	else
		echo '====> No nvim'
		exit 0
	fi

	echo '====> Remove nvim'
	rm -r ~/.config/nvim >/dev/null 2>&1

	echo '====> move nvim folder back'
	mv "${config_path}"/bak/nvim_bak ~/.config/nvim >/dev/null 2>&1
fi
