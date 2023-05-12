#!/usr/bin/env bash

config_path=$(
	cd "$(dirname "${0}")" || exit
	pwd
)

commands=("all" "kitty" "zsh" "tmux" "vi" "neovim")
# 判断第一个命令行参数是否是 commands 中的一个
if [[ ! "${commands[*]}" =~ ${1} ]]; then
	echo "====> Error: Unknown parameter: ${1}"
	echo "====> Usage: ./uninstall.sh [all|kitty|zsh|tmux|vi|neovim]"
	exit 1
fi

if [[ "${1}" == "all" || "${1}" == "kitty" ]]; then
	echo "====> Remove kitty config file"
	rm -r ~/.config/kitty >/dev/null 2>&1

	echo "====> Move kitty config folder back"
	mv "${config_path}"/bak/kitty_bak ~/.config/kitty >/dev/null 2>&1

	echo "====> Uninstall kitty config success"
fi

if [[ "${1}" == "all" || "${1}" == "tmux" ]]; then
	echo "====> Remove tmux config file"
	rm ~/.tmux.conf >/dev/null 2>&1

	echo "====> Move backup tmux config file"
	mv "${config_path}/bak/tmux.conf.bak" ~/.tmux.conf

	echo "====> Delete tmux plugin"
	rm -rf ~/.tmux >/dev/null 2>&1

	echo "====> Uninstall tmux config success"
fi

if [[ "${1}" == "all" || "${1}" == "vim" ]]; then
	if [ -h ~/.vimrc ]; then
		echo '====> Uninstall vim'
	else
		echo '====> No vim'
		exit 0
	fi

	echo '====> Remove vimrc'
	rm ~/.vimrc >/dev/null 2>&1

	echo '====> Move vimrc file back'
	mv "${config_path}"/bak/vimrc.bak ~/.vimrc

  echo "====> Delete vim plugin"
  rm -rf ~/.vim >/dev/null 2>&1

  echo '====> Uninstall vim config success'
fi

if [[ "${1}" == "all" || "${1}" == "neovim" ]]; then
	if [ -h ~/.config/nvim ]; then
		echo '====> Uninstall neovim'
	else
		echo '====> No neovim'
		exit 0
	fi

	echo '====> Remove nvim config'
	rm -r ~/.config/nvim >/dev/null 2>&1

	echo '====> Move nvim folder back'
	mv "${config_path}"/bak/nvim_bak ~/.config/nvim >/dev/null 2>&1

  echo "====> Delete neovim plugin"
  rm -rf ~/.local/share/nvim >/dev/null 2>&1

  echo '====> Uninstall neovim config success'
fi

if [[ "${1}" == "all" || "${1}" == "zsh" ]]; then
  if [ -h ~/.zshrc ]; then
    echo '====> Uninstall zsh'
  else
    echo '====> No zsh'
    exit 0
  fi

  echo '====> Remove zshrc'
  rm ~/.zshrc >/dev/null 2>&1

  echo '====> Move zshrc file back'
  mv "${config_path}"/bak/zshrc.bak ~/.zshrc

  echo "====> Remove P10k config"
  rm ~/.p10k.zsh >/dev/null 2>&1

  echo "====> Remove fzf plugin"
  rm -rf ~/.fzf.zsh >/dev/null 2>&1

  echo '====> Uninstall zsh config success'

fi

