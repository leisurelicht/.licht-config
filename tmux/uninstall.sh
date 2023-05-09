#!/usr/bin/env bash

install_path=$(
	cd $(dirname $0)
	pwd
)

config_path=$(
	cd $install_path/..
	pwd
)


echo "====> Delete tmux config file"
rm ~/.tmux.conf >/dev/null 2>&1

echo "====> Restore backup tmux config file"
mv $config_path/bak/tmux.conf.bak ~/.tmux.conf

echo "====> Delete tmux plugin"
rm -rf ~/.tmux >/dev/null 2>&1

echo "====> Uninstall tmux config Success"
