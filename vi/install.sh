#!/usr/bin/env bash

install_path=$(
	cd "$(dirname "$0")" || exit
	pwd
)
config_path=$(
	cd "$install_path/.." || exit
	pwd
)
echo "====> Config file root path is: ${config_path}"

git_need_install=0
nvim_need_install=0
vim_need_install=0

if ! command -v git >/dev/null 2>&1; then
	echo "====> Command [git] is not be installed."
	git_need_install=1
fi

if ! command -v vim >/dev/null 2>&1; then
	echo "====> [vim] is not be installed."
	vim_need_install=1
fi

if ! command -v nvim >/dev/null 2>&1; then
	echo "====> [neovim] is not be installed."
	nvim_need_install=1
fi


if [[ $(uname -s) == 'Darwin' ]]; then
	if ! command -v brew >/dev/null 2>&1; then
		echo "====> Command [brew] is not be installed, Start To install."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	if [[ ${git_need_install} == 1 ]]; then
		echo "====> Install Command [git]."
		brew install git
		git_need_install=0
	fi
	if [[ ${nvim_need_install} == 1 ]]; then
		echo "====> Install Command [neovim]."
		brew install neovim
		nvim_need_install=0
	fi
	if [[ ${vim_need_install} == 1 ]]; then
		echo "====> Install Command [vim]."
		brew install vim
		vim_need_install=0
	fi
elif [[ $(uname -s) == 'Linux' ]]; then
	os=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
	if [[ ${os} == "ubuntu" ]]; then
		if [[ ${git_need_install} == 1 ]]; then
			echo "====> Install Command [git]."
			sudo apt-get install git -y
			git_need_install=0
		fi
    if [[ ${vim_need_install} == 1 ]]; then
      echo "====> Install Command [vim]."
      sudo apt-get install vim -y
      vim_need_install=0
    fi

	elif [[ ${os} == "centos" ]]; then
		if [[ ${git_need_install} == 1 ]]; then
			echo "====> Install Command [git]."
			sudo yum install git -y
			git_need_install=0
		fi
    if [[ ${vim_need_install} == 1 ]]; then
      echo "====> Install Command [vim]."
      sudo yum install vim -y
      vim_need_install=0
    fi
	fi
fi

echo "====> Create back up dir"

echo "====> Back up dir path is: ${config_path}/bak"
if [ ! -d "$config_path/bak" ]; then
	mkdir -p "$config_path/bak"
fi

if [[ ${1} == "" || ${1} == "vim" ]]; then
	# 安装 vim 配置文件
	if [ -f "$HOME/.vimrc" ]; then
		echo "====> Vim config file vimrc is exist, backup and delete it."
		mv "$HOME/.vimrc" "$config_path/bak/vimrc.bak"
	fi

	echo "====> Create vimrc link"
	rm "$HOME/.vimrc" >/dev/null 2>&1
	ln -s "$config_path/vi/vimrc" "$HOME/.vimrc"

	# 安装vim插件
	echo "====> Install vim PlugInstaller"
	vim +PlugInstall +UpdateRemotePlugins +qa
fi

if [[ ${1} == "" || ${1} == "nvim" ]]; then
	# 安装 neovim 配置文件
	if [ ! -d "$HOME/.config/" ]; then
		mkdir "$HOME/.config/"
	fi

	if [ -d "$HOME/.config/nvim" ]; then
		echo "====> Neovim config dir nvim is exist, backup and delete it."
		mv "$HOME/.config/nvim" "$config_path/bak/nvim_bak"
	fi

	echo "====> Create nvim symbolic link to config directory"
	ln -s "$config_path/vi/nvim" "$HOME/.config/nvim"

	# 安装neovim插件
	echo "====> Install nvim PlugInstaller"
	nvim +Lazy +qa
fi

echo "**** Please change Non-ASCII Font to Hack Nerd Font ****"
