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

if ! command -v brew >/dev/null 2>&1; then
	echo "====> Command brew is not be installed, start to install"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "====> Commnad brew is already installed"
fi

echo "====> Use brew to intall necessary"

brew install vim 2>&1
brew link vim
brew install neovim 2>&1
# brew install fcitx-remote-for-osx --with-input-method=osx-pinyin
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

echo "====> Create back up dir"

echo "====> Back up dir path is: ${config_path}/bak"
if [ ! -d $config_path/bak ]; then
	mkdir -p $config_path/bak
fi

# 安装 vim 配置文件
if [ -f $HOME/.vimrc ]; then
	echo "====> Vim config file vimrc is exist, backup and delete it."
	mv $HOME/.vimrc $config_path/bak/vimrc.bak
fi

echo "====> Create vimrc link"
rm $HOME/.vimrc >/dev/null 2>&1
ln -s $config_path/vi/vimrc $HOME/.vimrc

# 安装vim插件
# echo "====> Install vim PlugInstall"
# vim +PlugInstall +UpdateRemotePlugins +qa

# 安装 neovim 配置文件
if [ ! -d $HOME/.config/ ]; then
	mkdir $HOME/.config/
fi

if [ -d $HOME/.config/nvim ]; then
	echo "====> Neovim config dir nvim is exist, backup and delete it."
	mv $HOME/.config/nvim $config_path/bak/nvim_bak
fi

echo "====> Create neovim config dir"
if [ -d $HOME/.config/nvim ]; then
	rm -r $HOME/.config/nvim >/dev/null 2>&1
fi
mkdir -p $HOME/.config/nvim

echo "====> Create neovim init file links"
if [ -d $HOME/.config/nvim/init.vim ]; then
	rm $HOME/.config/nvim/init.vim >/dev/null 2>&1
fi
ln -s $config_path/vi/vimrc $HOME/.config/nvim/init.vim

# 安装vim插件
# echo "====> Install vim PlugInstall"
# nvim +PackerInstall +qa

echo "**** Please change Non-ASCII Font to Hack Nerd Font ****"
