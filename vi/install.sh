#!/usr/bin/env bash

# 判断第一个命令行参数是否为 vim 或 neovim
if [[ "${1}" == "vim" || "${1}" == "neovim" ]]; then
	echo "====> Start to install ${1} config file."
else
	echo "====> Error: Unknown parameter: ${1}"
	echo "====> Usage: ./install.sh [vim|neovim]"
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

# 安装 vim 及 neovim 所需的依赖
# 第一行是命令执行的名称，第二行是命令安装的名称
installed=("git" "git")

if [[ "${1}" == "vim" ]]; then
	installed+=("vim" "vim")
fi

if [[ "${1}" == "neovim" ]]; then
	installed+=(
		"nvim"
		"neovim"
		"lua"
		"lua"
		"luarocks"
		"luarocks"
		"node"
		"node"
		"sqlite"
		"sqlite"
	)
fi

if [[ $(uname -s) == 'Darwin' ]]; then
	if ! command -v brew >/dev/null 2>&1; then
		echo "====> Command [ brew ] is not installed, Start To install."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	if ! brew tap | grep -q "daipeihust/tap"; then
		brew tap leisurelicht/tap
	fi

	install+=(
		"im-select"
		"im-select"
	)

	brew_list=$(brew list)
	for ((i = 0; i < "${#installed[@]}"; )); do
		if [[ ${brew_list} == *"${installed[$i + 1]}"* ]]; then
			echo "====> Command [ ${installed[$i + 1]} ] have been installed."
		else
			echo "----> Install Command [ ${installed[$i + 1]} ]."
			brew install "${installed[$i + 1]}"
		fi
		i=$((i + 2))
	done
elif [[ $(uname -s) == 'Linux' ]]; then
	# os=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
	need_exit=0
	for ((i = 0; i < "${#installed[@]}"; )); do
		if ! command -v "${installed[$i]}" >/dev/null 2>&1; then
			echo "====> Please Install Command [ ${installed[$i + 1]} ] Manually."
			need_exit=1
		fi
		i=$((i + 2))
	done
	if [[ ${need_exit} == 1 ]]; then
		exit 1
	fi
fi

if [ ! -d "${config_path}/bak" ]; then
	mkdir -p "${config_path}/bak"
fi

if [[ ${1} == "vim" ]]; then
	# 安装 vim 配置文件
	if [ -f "${HOME}/.vimrc" ]; then
		echo "====> Vim config file the vimrc has exist"
		echo "====> Backup to [ ${config_path}/bak ] and delete it."
		mv "${HOME}/.vimrc" "${config_path}/bak/vimrc.bak"
	fi

	echo "====> Create vimrc link"
	rm "${HOME}/.vimrc" >/dev/null 2>&1
	ln -s "${config_path}/vi/vimrc" "${HOME}/.vimrc"

	# 安装vim插件
	echo "====> Install vim Plugins"
	vim +PlugInstall +UpdateRemotePlugins +qa
fi

if [[ ${1} == "neovim" ]]; then
	# 安装 neovim 配置文件
	if [ ! -d "${HOME}/.config/" ]; then
		mkdir "${HOME}/.config/"
	fi

	if [ -d "${HOME}/.config/nvim" ]; then
		if [ -h "${HOME}/.config/nvim" ]; then
			echo "====> Neovim config dir is a link file, only delete it."
			rm -r "${HOME}/.config/nvim"
		else
			echo "====> Neovim config dir the nvim has exist"
			echo "====> Backup to [ ${config_path}/bak ] and delete it."
			mv "${HOME}/.config/nvim" "${config_path}/bak/nvim_bak"
		fi
	fi

	echo "====> Create nvim symbolic link to config directory"
	ln -s "${config_path}/vi/nvim" "${HOME}/.config/nvim"

	# 安装neovim插件
	echo "====> Install nvim Plugins"
	nvim +Lazy +qa
fi

echo "**** Please change Non-ASCII Font to Hack Nerd Font ****"
