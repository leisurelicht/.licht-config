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

# 安装 kitty 及 kitty 所需的依赖
if [[ $(uname -s) == 'Darwin' ]]; then
	if ! command -v brew >/dev/null 2>&1; then
		echo "====> [ brew ] is not installed, Start To install."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	brew_list=$(brew list)
	if [[ ${brew_list} == *"kitty"* ]]; then
		echo "====> [ kitty ] have been installed."
	else
		echo "----> Install [ kitty ]."
		brew install kitty
	fi
fi

if [ ! -d "${HOME}/.config/" ]; then
	mkdir "${HOME}/.config/"
fi

if [ -d "${HOME}/.config/kitty" ]; then
	if [ -h "${HOME}/.config/kitty/" ]; then
		echo "====> Kitty config dir is a link file, only delete it."
		rm -r "${HOME}/.config/kitty"
	else
		echo "====> Kitty config dir has exist"
		echo "====> Backup to [ ${config_path}/bak ] and delete it."
		mv "${HOME}/.config/kitty" "${config_path}/bak/kitty_bak"
	fi
fi

echo "====> Create nvim symbolic link to config directory"
ln -s "${config_path}/kitty" "${HOME}/.config/kitty"
