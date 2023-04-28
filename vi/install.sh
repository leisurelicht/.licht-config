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

if [[ $(uname -s) == 'Darwin' ]]; then
	if ! command -v brew >/dev/null 2>&1; then
		echo "====> Command [brew] is not be installed, Start To install."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
fi

install_vim=0
install_neovim=0

if [[ "${1}" == "vim" ]]; then
	install_vim=1
elif [[ "${1}" == "neovim" ]]; then
	install_neovim=1
elif [[ "${1}" == "" ]]; then
	install_vim=1
	install_neovim=1
else
	echo "====> Error: Unknown parameter: ${1}"
	exit 1
fi

# 安装 vim 及 neovim 所需的依赖
# 第一行是命令安装的名称，第二行是命令执行的名称
installed=(
	"git"
	"git"
)

if [[ ${install_vim} == 1 ]]; then
	installed+=("vim" "vim")
fi

if [[ ${install_neovim} == 1 ]]; then
	installed+=("neovim" "nvim")
fi

for ((i = 0; i < ${#installed[@]}; )); do
	if ! command -v "${installed[$i + 1]}" >/dev/null 2>&1; then
		echo "====> Command [${installed[$i]}] is not be installed."
		if [[ $(uname -s) == 'Darwin' ]]; then
			echo "----> Install Command [${installed[$i]}]."
			brew install "${installed[$i]}"
		elif [[ $(uname -s) == 'Linux' ]]; then
			os=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
			if [[ ${os} == "ubuntu" ]]; then
				echo "----> Install Command [${installed[$i]}]."
				sudo apt-get install "${installed[$i]}" -y
			elif [[ ${os} == "centos" ]]; then
				echo "----> Install Command [${installed[$i]}]."
				sudo yum install "${installed[$i]}" -y
			fi
		fi
	else
		echo "====> Command [${installed[$i]}] is installed."
	fi
	i=$((i + 2))
done

echo "====> Create back up dir"

echo "====> Back up dir path is: ${config_path}/bak"
if [ ! -d "${config_path}/bak" ]; then
	mkdir -p "${config_path}/bak"
fi

if [[ ${install_vim} == 1 ]]; then
	# 安装 vim 配置文件
	if [ -f "${HOME}/.vimrc" ]; then
		echo "====> Vim config file vimrc is exist, backup and delete it."
		mv "${HOME}/.vimrc" "${config_path}/bak/vimrc.bak"
	fi

	echo "====> Create vimrc link"
	rm "${HOME}/.vimrc" >/dev/null 2>&1
	ln -s "${config_path}/vi/vimrc" "${HOME}/.vimrc"

	# 安装vim插件
	echo "====> Install vim PlugInstaller"
	vim +PlugInstall +UpdateRemotePlugins +qa
fi

if [[ ${install_neovim} == 1 ]]; then
	# 安装 neovim 配置文件
	if [ ! -d "${HOME}/.config/" ]; then
		mkdir "${HOME}/.config/"
	fi

	if [ -d "${HOME}/.config/nvim" ]; then
		if [ -h "${HOME}/.config/nvim" ]; then
			echo "====> Neovim config dir is a link file, delete it."
			rm -r "${HOME}/.config/nvim"
		else
			echo "====> Neovim config dir nvim is exist, backup and delete it."
			mv "${HOME}/.config/nvim" "${config_path}/bak/nvim_bak"
		fi
	fi

	echo "====> Create nvim symbolic link to config directory"
	ln -s "${config_path}/vi/nvim" "${HOME}/.config/nvim"

	# 安装neovim插件
	echo "====> Install nvim PlugInstaller"
	nvim +Lazy +qa
fi

echo "**** Please change Non-ASCII Font to Hack Nerd Font ****"
