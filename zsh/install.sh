#!/usr/bin/env bash

has() {
	command -v "$1" >/dev/null 2>&1
}

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
		echo "====> [ brew ] is not installed, Start To install."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	if ! brew tap | grep -q "homebrew/cask-fonts"; then
		brew tap homebrew/cask-fonts
	fi

	installed=(
		"lua"
		"zsh"
		"git"
		"fzf"
		"zoxid"
		"ripgrep"
		"bat"
		"trash"
		"fd"
		"font-hack-nerd-font"
		"iterm2"
		"browserosaurus"
	)

	brew_list=$(brew list)
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
elif [[ $(uname -s) == 'Linux' ]]; then
	installed=(
		"git"
		"git"
		"zsh"
		"zsh"
		"lua"
		"lua"
		"rg"
		"ripgrep"
		"batcat"
		"batcat"
		"fd"
		"fd-find"
	)

	os=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
	if [[ ${os} == "ubuntu" ]]; then
		for ((i = 0; i < "${#installed[@]}"; )); do
			if ! has "${installed[$i]}"; then
				echo "----> Install [ ${installed[$i + 1]} ]."
				sudo apt-get install "${installed[$i + 1]}" -y
			else
				echo "====> [ ${installed[$i + 1]} ] have been installed."
			fi
			i=$((i + 2))
		done
	elif [[ ${os} == "centos" ]]; then
		dnf copr enable atim/zoxide
		for ((i = 0; i < "${#installed[@]}"; )); do
			if ! has "${installed[$i]}"; then
				echo "----> Install [ ${installed[$i + 1]} ]."
				sudo yum install "${installed[$i + 1]}" -y
			else
				echo "====> [ ${installed[$i + 1]} ] have been installed."
			fi
			i=$((i + 2))
		done
	fi

	if ! command -v fzf >/dev/null 2>&1; then
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		~/.fzf/install
	fi
fi

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
if [ -f "${HOME}"/.fzf.zsh ]; then
	echo "====> Fzf config file ${HOME}/.fzf.zsh exist, update it"
	fzf_config=$(cat "${config_path}"/zsh/fzf.zsh)
	if grep -F "${fzf_config}" "${HOME}"/.fzf.zsh >/dev/null; then
		echo "====> Fzf config is already insert to [ ${HOME}/.fzf.zsh ]"
	else
		echo "$fzf_config" >>"${HOME}"/.fzf.zsh
	fi
fi

# 创建备份文件地址
if [ ! -d "$config_path"/bak ]; then
	mkdir -p "$config_path"/bak
fi

# 备份已有的zshrc文件
if [ -f ~/.zshrc ]; then
	echo "====> Zsh config file zshrc is exist."
	echo "====> Backup to [ ${config_path/bak/} ] and delete it."
	mv ~/.zshrc "$config_path"/bak/zshrc.bak
	rm ~/.zshrc >/dev/null 2>&1
fi

echo "====> Create zshrc link"
ln -s "$config_path"/zsh/zshrc ~/.zshrc

# 备份已有的p10k.zsh文件
if [ -f ~/.p10k.zsh ]; then
	echo "====> P10k config file .p10k.zsh is exist."
	echo "====> Backup to [ ${config_path/bak/} ] and delete it."
	mv ~/.p10k.zsh "$config_path"/bak/p10k.zsh.bak
	rm ~/.p10k.zsh >/dev/null 2>&1
fi

echo "====> Create p10k link"
ln -s "$config_path"/zsh/p10k.zsh ~/.p10k.zsh

# 切换到zsh
echo "====> Change to zsh"
chsh -s /bin/zsh
zsh

source "${HOME}/.zshrc"
