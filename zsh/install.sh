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

zsh_need_install=0
git_need_install=0
fzf_need_install=0

if ! command -v lua >/dev/null 2>&1; then
	echo "====> [lua] is not be installed. Please install first"
fi

if ! command -v zsh >/dev/null 2>&1; then
	echo "====> [zsh] is not be installed."
	zsh_need_install=1
fi

if ! command -v git >/dev/null 2>&1; then
	echo "====> Command [git] is not be installed."
	git_need_install=1
fi

if ! command -v fzf >/dev/null 2>&1; then
	echo "====> Command [fzf] is not be installed."
	fzf_need_install=1
fi

if [[ $(uname) == 'Darwin' ]]; then
	# 安装包管理器
	if ! command -v brew >/dev/null 2>&1; then
		echo "====> Install Command [brew]"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "====> Homebrew is already installed."
	fi
	# 安装软件
	if [[ ${zsh_need_install} == 1 ]]; then
		echo "====> Install Command [zsh]"
		brew install zsh
		zsh_need_install=0
	fi
	if [[ ${git_need_install} == 1 ]]; then
		echo "====> Install Command [git]."
		brew install git
		git_need_install=0
	fi
	if [[ ${fzf_need_install} == 1 ]]; then
		echo "====> Install Command [fzf]"
		brew install fzf
		$(brew --prefix)/opt/fzf/install
		fzf_need_install=0
	fi
elif [[ $(uname -s) == 'Linux' ]]; then
	os=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
	if [[ ${os} == "ubuntu" ]]; then
		if [[ ${zsh_need_install} == 1 ]]; then
			echo "====> Install Command [zsh]."
			sudo apt-get install zsh -y
			zsh_need_install=0
		fi
		if [[ ${git_need_install} == 1 ]]; then
			echo "====> Install Command [git]."
			sudo apt-get install git -y
			git_need_install=0
		fi
		if [[ ${fzf_need_install} == 1 ]]; then
			echo "====> Install Command [fzf]."
			sudo apt-get install fzf -y
			fzf_need_install=0
		fi
	elif [[ ${os} == "centos" ]]; then
		if [[ ${zsh_need_install} == 1 ]]; then
			echo "====> Install Command [zsh]."
			sudo yum install zsh -y
			zsh_need_install=0
		fi
		if [[ ${git_need_install} == 1 ]]; then
			echo "====> Install Command [git]."
			sudo yum install git -y
			git_need_install=0
		fi
		if [[ ${fzf_need_install} == 1 ]]; then
			echo "====> Install Command [fzf]."
			sudo yum install fzf -y
			fzf_need_install=0
		fi
	fi
fi

if [[ ${zsh_need_install} == 1 ]] ||
	[[ ${git_need_install} == 1 ]]; then
	echo "====> Need Install Command [zsh] [git] First"
	exit 1
fi

# 安装zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -e "$ZINIT_HOME" ]; then
	echo "====> Zinit is not be installed, start to install"
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
	if [ $? -ne 0 ]; then
		echo "xxxx> Install zinit failed, install stop"
		exit 1
	fi
else
	echo "====> Zinit is already install"
fi

# 创建备份文件地址
if [ ! -d $config_path/bak ]; then
	mkdir -p $config_path/bak
fi

echo "====> Back up dir path is: ${config_path}/bak"

# 备份已有的zshrc文件
if [ -f ~/.zshrc ]; then
	echo "====> Zsh config file zshrc is exist, backup and delete it."
	mv ~/.zshrc $config_path/bak/zshrc.bak
	rm ~/.zshrc >/dev/null 2>&1
fi

echo "====> Create zshrc link"
ln -s $config_path/zsh/zshrc ~/.zshrc

# 备份已有的p10k.zsh文件
if [ -f ~/.p10k.zsh ]; then
	echo "====> p10k config file .p10k.zsh is exist, backup and delete it."
	mv ~/.p10k.zsh $config_path/bak/p10k.zsh.bak
	rm ~/.p10k.zsh >/dev/null 2>&1
fi

echo "====> Create p10k link"
ln -s $config_path/zsh/p10k.zsh ~/.p10k.zsh

# 备份已有的 fzf 文件
if [ -f ~/.fzf.zsh ]; then
	echo "====> fzf config file is .fzf.zsh exist, backup and delete it."
	mv ~/.fzf.zsh $config_path/bak/fzf.zsh.bak
	rm ~/.fzf.zsh >/dev/null 2>&1
fi

echo "====> Create fzf link"
ln -s $config_path/zsh/fzf.zsh ~/.fzf.zsh

# 切换到zsh
echo "====> Change to zsh"
chsh -s /bin/zsh
zsh

source ~/.zshrc