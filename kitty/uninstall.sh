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

if [ -h ~/.config/kitty ]; then
	echo '====> Delete kitty config'
else
	echo '====> No kitty config'
	exit 0
fi

echo '====> Remove kitty config'
rm -r ~/.config/kitty >/dev/null 2>&1

echo '====> move kitty config folder back'
mv "${config_path}"/bak/kitty_bak ~/.config/kitty >/dev/null 2>&1
