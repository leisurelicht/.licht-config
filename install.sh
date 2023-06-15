#!/bin/bash

has() {
	command -v "$1" >/dev/null 2>&1
}

install_on_mac() {
	if ! has brew; then
		echo "====> [ brew ] is not installed, Start To install."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	brew_list=$(brew list)

	if ! [[ ${brew_list} == *"git"* ]]; then
		echo "----> Install [ git ]."
		brew install git
	fi

	if [[ ${kitty} == 1 ]]; then
		if ! [[ ${brew_list} == *"kitty"* ]]; then
			echo "----> Install [ kitty ]."
			brew install kitty
		fi
	elif [[ ${zsh} == 1 ]]; then
		installed=("lua" "zsh" "git" "fzf" "zoxid" "ripgrep" "bat" "trash" "fd")

		for soft in "${installed[@]}"; do
			if [[ ${brew_list} == *"${soft}"* ]]; then
				echo "====> [ ${soft} ] has been installed."
			else
				echo "----> Install [${soft}]."
				brew install "${soft}"
			fi
		done
		if [[ ! -e "${HOME}/.fzf.zsh" ]]; then
			"$(brew --prefix)"/opt/fzf/install
		fi
	elif [[ ${tmux} == 1 ]]; then
		if ! [[ ${brew_list} == *"tmux"* ]]; then
			echo "----> Install [ tmux ]."
			brew install tmux
		fi
	elif [[ ${vim} == 1 ]]; then
		installed+=("vim" "vim" "im-select" "im-select" "curl" "curl")
		if ! brew tap | grep -q "daipeihust/tap"; then
			brew tap daipeihust/tap
		fi

		for ((i = 0; i < "${#installed[@]}"; )); do
			if [[ ${brew_list} == *"${installed[$i + 1]}"* ]]; then
				echo "====> [ ${installed[$i + 1]} ] have been installed."
			else
				echo "----> Install [ ${installed[$i + 1]} ]."
				brew install "${installed[$i + 1]}"
			fi
			i=$((i + 2))
		done
	elif [[ ${neovim} == 1 ]]; then
		installed+=(
			"nvim" "neovim"
			"lua" "lua"
			"luarocks" "luarocks"
			"node" "node"
			"sqlite" "sqlite"
			"im-select" "im-select"
		)
		if ! brew tap | grep -q "daipeihust/tap"; then
			brew tap daipeihust/tap
		fi

		for ((i = 0; i < "${#installed[@]}"; )); do
			if [[ ${brew_list} == *"${installed[$i + 1]}"* ]]; then
				echo "====> [ ${installed[$i + 1]} ] have been installed."
			else
				echo "----> Install [ ${installed[$i + 1]} ]."
				brew install "${installed[$i + 1]}"
			fi
			i=$((i + 2))
		done
	fi
}

install_on_linux() {
	need_exit=0
	if [[ ${kitty} == 1 ]]; then
		if ! has "kitty"; then
			echo "----> Please Install [ kitty ]."
			need_exit=1
		fi
	elif [[ ${zsh} == 1 ]]; then
		installed=(
			"git" "git"
			"zsh" "zsh"
			"lua" "lua"
			"rg" "ripgrep"
			"batcat" "bat"
			"fdfind" "fd-find"
		)

		for ((i = 0; i < "${#installed[@]}"; )); do
			if ! has "${installed[i]}"; then
				echo "----> Please Install [ ${installed[i + 1]} ]."
				need_exit=1
			fi
			((i += 2))
		done
	elif [[ ${tmux} == 1 ]]; then
		installed=(
			"git" "git"
			"tmux" "tmux"
		)

		for ((i = 0; i < "${#installed[@]}"; )); do
			if ! has "${installed[i]}"; then
				echo "----> Please Install [ ${installed[i + 1]} ]."
				need_exit=1
			fi
			((i += 2))
		done
	elif [[ ${vim} == 1 ]]; then
		installed=(
			"git" "git"
			"vim" "vim"
		)

		for ((i = 0; i < "${#installed[@]}"; )); do
			if ! has "${installed[i]}"; then
				echo "----> Please Install [ ${installed[i + 1]} ]."
				need_exit=1
			fi
			((i += 2))
		done
	elif [[ ${neovim} == 1 ]]; then
		installed=(
			"git" "git"
			"nvim" "neovim"
			"lua" "lua"
			"luarocks" "luarocks"
			"node" "node"
			"sqlite" "sqlite"

		)

		for ((i = 0; i < "${#installed[@]}"; )); do
			if ! has "${installed[i]}"; then
				echo "----> Please Install [ ${installed[i + 1]} ]."
				need_exit=1
			fi
			((i += 2))
		done
	fi
	if [[ ${need_exit} == 1 ]]; then
		exit 1
	fi
}

# ------------------------------

config_path="${HOME}/.licht-config"

current_path=$(
	cd "$(dirname "${0}")" || exit
	pwd
)

# 判断 config_path 与 current_path 是否不相同
if [[ ! "${config_path}" == "${current_path}" ]]; then
	if [ ! -d "${config_path}" ]; then
		mkdir -p "${config_path}"
	fi
	# 将工作目录切换到 config_path
	cd "${config_path}" || exit
fi

echo "====> Config file root path is: ${config_path}"

commands=("all" "kitty" "zsh" "tmux" "vim" "neovim")
# 判断第一个命令行参数是否是 commands 中的一个
if [[ ! "${commands[*]}" =~ ${1} ]]; then
	echo "====> Error: Unknown parameter: ${1}"
	echo "====> Usage: ./install.sh [all|kitty|zsh|tmux|vim|neovim]"
	exit 1
fi

kitty=0 zsh=0 tmux=0 vim=0 neovim=0

case ${1} in
all)
	kitty=1 zsh=1 tmux=1 vim=1 neovim=1
	;;
kitty)
	kitty=1
	;;
zsh)
	zsh=1
	;;
tmux)
	tmux=1
	;;
vim)
	vim=1
	;;
neovim)
	neovim=1
	;;
esac

if [[ $(uname -s) == 'Darwin' ]]; then
	install_on_mac
elif [[ $(uname -s) == 'Linux' ]]; then
	os=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
	if [[ ${os} == "ubuntu" ]]; then
		install_on_linux
	elif [[ ${os} == "centos" ]]; then
		install_on_linux
	fi
fi

if [ ! -d "${HOME}/.config/" ]; then
	mkdir -p "${HOME}/.config"
fi

if [ ! -d "${config_path}/bak" ]; then
	mkdir -p "${config_path}/bak"
fi

#
if [[ ${kitty} == 1 ]]; then
	if [ ! -d "${HOME}/.config/kitty" ]; then
		mkdir "${HOME}/.config/kitty"
	else
		echo "====> Kitty config dir has exist"
		echo "====> Backup to [ ${config_path}/bak ] and delete it."
		mv "${HOME}/.config/kitty" "${config_path}/bak/kitty_bak"
		mkdir "${HOME}/.config/kitty"
	fi
	echo "====> Create symlink for kitty config"
	ln -sf "${config_path}/kitty/kitty.conf" "${HOME}/.config/kitty/kitty.conf"
fi

if [[ ${tmux} == 1 ]]; then
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

	if [ -f ~/.tmux.conf ]; then
		echo "====> Tmux config file [tmux.conf] is exist, backup and delete it."
		mv ~/.tmux.conf "${config_path}/bak/tmux.conf.bak"
		rm ~/.tmux.conf >/dev/null 2>&1
	fi

	echo "====> Create symlink for tmux config"
	ln -sf "${config_path}/tmux/tmux.conf" ~/.tmux.conf
fi

if [[ ${vim} == 1 ]]; then
	# 安装 vim 配置文件
	if [ -f "${HOME}/.vimrc" ]; then
		echo "====> Vim config file the vimrc has exist"
		echo "====> Backup to [ ${config_path}/bak ] and delete it."
		mv "${HOME}/.vimrc" "${config_path}/bak/vimrc.bak"
	  rm "${HOME}/.vimrc" >/dev/null 2>&1
	fi

  echo "====> Create symlink for vim config"
	ln -sf "${config_path}/vi/vim/vimrc" "${HOME}/.vimrc"

	# 安装vim插件
	echo "====> Install vim plugins"
	vim +PlugInstall +UpdateRemotePlugins +qa
fi

if [[ ${neovim} == 1 ]]; then
	# 安装 neovim 配置文件
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

  echo "====> Create symlink for neovim config"
	ln -sf "${config_path}/vi/nvim" "${HOME}/.config/nvim"

	# 安装neovim插件
	echo "====> Install nvim plugins"
	nvim +Lazy +qa

fi

if [[ ${zsh} == 1 ]]; then
	# golang version manager
	if ! has "g"; then
		echo "----> Install [ g ]."
		curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
	fi

	# nvm
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

	# zinit
	bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

	# 更新的 fzf 配置文件
	if [[ -f "${HOME}/.fzf.zsh" ]]; then
		echo "====> Fzf config file [ ${HOME}/.fzf.zsh ] exist, update it."
		fzf_config=$(cat "${config_path}/zsh/fzf.zsh")
		if grep -qxF "# Fzf Custom Config" "${HOME}/.fzf.zsh"; then
			echo "====> Custom Fzf config is already insert to [ ${HOME}/.fzf.zsh ]"
		else
			echo "====> Append Custom Fzf config to [ ${HOME}/.fzf.zsh ]"
			echo "${fzf_config}" >>"${HOME}"/.fzf.zsh
		fi
	fi

	# 备份已有的p10k.zsh文件
	if [[ -f "${HOME}/.p10k.zsh" ]]; then
		echo "====> P10k config file .p10k.zsh is exist."
		echo "====> Backup to [ ${config_path/bak/} ] and delete it."
		mv "${HOME}/.p10k.zsh" "${config_path}"/bak/p10k.zsh.bak
		rm "${HOME}/.p10k.zsh" >/dev/null 2>&1
	fi

	echo "====> Create symlink for p10k config"
	ln -sf "${config_path}"/zsh/p10k.zsh ~/.p10k.zsh

	if [[ -f "${HOME}/.zshrc" ]]; then
		echo "====> Zsh config file the [ zshrc ] has exist."
		echo "====> Backup to [ ${config_path}/bak ] and delete it."
		mv "${HOME}/.zshrc" "${config_path}/bak/zshrc.bak"
		rm "${HOME}/.zshrc" >/dev/null 2>&1
	fi

	echo "====> Create symlink for zsh config"
	ln -sf "${config_path}"/zsh/zshrc ~/.zshrc

	echo "====> Change to zsh"
	chsh -s /bin/zsh
	zsh

	# shellcheck disable=SC1090
	source ~/.zshrc
fi

echo "**** Please change Non-ASCII Font to Hack Nerd Font ****"
