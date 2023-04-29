#!/usr/bin/env bash

install_path=$(
	cd "$(dirname "${0}")" || exit
	pwd
)

config_path=$(
	cd "${install_path}/.." || exit
	pwd
)

echo "====> Config file root path is: ${config_path}"

lua_need_install=0
zsh_need_install=0
git_need_install=0
fzf_need_install=0
fd_need_install=0
rg_need_install=0
zoxide_need_install=0
exa_need_install=0
bat_need_install=0
trash_need_install=0
nvim_need_install=0

if ! command -v lua >/dev/null 2>&1; then
	echo "====> [lua] is not be installed. Please install first"
	lua_need_install=1
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

if ! command -v rg >/dev/null 2>&1; then
	echo "====> Command [rg] is not be installed."
	rg_need_install=1
fi

if ! command -v fd >/dev/null 2>&1; then
	echo "====> Command [fd] is not be installed."
	fd_need_install=1
fi

if ! command -v zoxide >/dev/null 2>&1; then
	echo "====> Command [zoxide] is not be installed."
	zoxide_need_install=1
fi

if ! command -v exa >/dev/null 2>&1; then
	echo "====> Command [exa] is not be installed."
	exa_need_install=1
fi

if ! command -v bat >/dev/null 2>&1; then
	echo "====> Command [bat] is not be installed."
	bat_need_install=1
fi

if ! command -v trash >/dev/null 2>&1; then
	echo "====> Command [trash] is not be installed."
	trash_need_install=1
fi

if ! command -v g >/dev/null 2>&1; then
	curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
fi

if ! command -v nvm >/dev/null 2>&1; then
	echo "====> Command [nvm] is not be installed."
	trash_need_install=1
fi

if [[ $(uname) == 'Darwin' ]]; then
	# 安装包管理器
	if ! command -v brew >/dev/null 2>&1; then
		echo "====> Install Command [brew]"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "====> Homebrew is already installed."
	fi

	brew tap homebrew/cask-fonts
	brew install font-hack-nerd-font
	brew install iterm2

	if [[ ${lua_need_install} == 1 ]]; then
		echo "===> Install Command [lua]"
		brew install lua
		lua_need_install=0
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
		"$(brew --prefix)"/opt/fzf/install
		fzf_need_install=0
	fi
	if [[ ${rg_need_install} == 1 ]]; then
		echo "====> Install Command [rg]"
		brew install ripgrep
		rg_need_install=0
	fi
	if [[ ${fd_need_install} == 1 ]]; then
		echo "====> Install Command [fd]"
		brew install fd
		fd_need_install=0
	fi
	if [[ ${zoxide_need_install} == 1 ]]; then
		echo "====> Install Command [zoxide]"
		brew install zoxide
		zoxide_need_install=0
	fi
	if [[ ${exa_need_install} == 1 ]]; then
		echo "====> Install Command [exa]"
		brew install exa
		exa_need_install=0
	fi
	if [[ ${bat_need_install} == 1 ]]; then
		echo "====> Install Command [bat]"
		brew install bat
		bat_need_install=0
	fi
	if [[ ${trash_need_install} == 1 ]]; then
		echo "====> Install Command [trash]"
		brew install trash
		trash_need_install=0
	fi
  if [[ ${nvm_need_install} == 1 ]]; then
		echo "====> Install Command [nvm]"
		brew install nvm
		nvm_need_install=0
	fi
elif [[ $(uname -s) == 'Linux' ]]; then
	os=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
	if [[ ${fzf_need_install} ]]; then
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		~/.fzf/install
		fzf_need_install=0
	fi
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
		if [[ ${rg_need_install} == 1 ]]; then
			echo "====> Install Command [rg]."
			sudo apt-get install ripgrep -y
			rg_need_install=0
		fi
		if [[ ${fd_need_install} == 1 ]]; then
			echo "====> Install Command [fd]."
			sudo apt install fd-find -y
			fd_need_install=0
		fi
		if [[ ${zoxide_need_install} == 1 ]]; then
			echo "====> Install Command [zoxide]"
			sudo apt install zoxide -y
			zoxide_need_install=0
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
		if [[ ${rg_need_install} == 1 ]]; then
			echo "====> Install Command [rg]."
			sudo yum install ripgrep -y
			rg_need_install=0
		fi
		if [[ ${fd_need_install} == 1 ]]; then
			echo "====> Install Command [fd]."
			sudo yum install fd-find -y
			fd_need_install=0
		fi
		if [[ ${zoxide_need_install} == 1 ]]; then
			echo "====> Install Command [zoxide]"
			dnf copr enable atim/zoxide
			dnf install zoxide
			zoxide_need_install=0
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
	mkdir -p "$(dirname "$ZINIT_HOME")"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
	if [ $? -ne 0 ]; then
		echo "xxxx> Install zinit failed, install stop"
		exit 1
	fi
else
	echo "====> Zinit is already install"
fi

# 创建备份文件地址
if [ ! -d "$config_path"/bak ]; then
	mkdir -p "$config_path"/bak
fi

# 备份已有的zshrc文件
if [ -f ~/.zshrc ]; then
	echo "====> Zsh config file zshrc is exist."
  echo "====> Backup to [${config_path/bak}] and delete it."
	mv ~/.zshrc "$config_path"/bak/zshrc.bak
	rm ~/.zshrc >/dev/null 2>&1
fi

echo "====> Create zshrc link"
ln -s "$config_path"/zsh/zshrc ~/.zshrc

# 备份已有的p10k.zsh文件
if [ -f ~/.p10k.zsh ]; then
	echo "====> P10k config file .p10k.zsh is exist."
  echo "====> Backup to [${config_path/bak}] and delete it."
	mv ~/.p10k.zsh "$config_path"/bak/p10k.zsh.bak
	rm ~/.p10k.zsh >/dev/null 2>&1
fi

echo "====> Create p10k link"
ln -s "$config_path"/zsh/p10k.zsh ~/.p10k.zsh

# 更新的 fzf 配置文件
if [ -f ~/.fzf.zsh ]; then
	echo "====> Fzf config file is .fzf.zsh exist, update it"
	fzf_config=$(cat "$config_path"/zsh/fzf.zsh)
	if grep -F "$fzf_config" "$HOME/.fzf.zsh" >/dev/null; then
		echo "====> Fzf config is already insert to .fzf.zsh"
	else
		echo "$fzf_config" >>~/.fzf.zsh
	fi
fi

# 切换到zsh
echo "====> Change to zsh"
chsh -s /bin/zsh
zsh

source "${HOME}/.zshrc"
