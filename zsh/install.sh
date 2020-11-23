#!/usr/bin/env bash

install_path=$(
  cd $(dirname $0)
  pwd
)

config_path=$( cd $install_path/..
  pwd
)

echo "====> Config file root path is: ${config_path}"

if [[ `uname` == 'Darwin'  ]]; then
  # 安装包管理器
  if ! command -v brew >/dev/null 2>&1; then
      echo "====> Homebrew is not be installed, start to install"
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
      echo "====> Homebrew is already install"
  fi

  # 安装软件
  if ! command -v zsh >/dev/null 2>&1; then
      echo "====> Zsh is not be installed, start to install"
      brew install zsh
  else
      echo "====> Zsh is already install"
  fi

  if ! command -v fzf >/dev/null 2>&1; then
      echo "====> Fzf is not be installed, start to install"
      brew install fzf
      $(brew --prefix)/opt/fzf/install --all
  else
      echo "====> Fzf is already install"
  fi

  if ! command -v brew >/dev/null 2>&1; then
      echo "====> Ag is not be installed, start to install"
      brew install ag
  else
      echo "====> Ag is already install"
  fi

  # 安装zinit
  if [ ! -d ~/.zinit  ]; then
    echo "====> Zinit is not be installed, start to install"
    mkdir ~/.zinit
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
  else
      echo "====> Zinit is already install"
  fi
fi

# echo "====> Use Gem to install necessary"
# gem install rough

# 创建备份文件地址
if [ ! -d $config_path/bak ]; then
    mkdir -p $config_path/bak
fi
echo "====> Back up dir path is: ${config_path}/bak"

# 备份已有的zshrc文件
if [ -f ~/.zshrc ]; then
    echo "====> Zsh config file zshrc is exist, backup and delete it."
    mv ~/.zshrc $config_path/bak/zshrc.bak
    rm ~/.zshrc >/dev/null 2>&1
fi

echo "====> Create zshrc link"
ln -s $config_path/zsh/zshrc ~/.zshrc

# 备份已有的p10k.zsh文件
if [ -f ~/.p10k.zsh ]; then
    echo "====> p10k config file zshrc is exist, backup and delete it."
    mv ~/.p10k.zsh $config_path/bak/p10k.zsh.bak
    rm ~/.p10k.zsh >/dev/null 2>&1
fi

echo "====> Create p10k link"
ln -s $config_path/zsh/p10k.zsh ~/.p10k.zsh

# 切换到zsh
echo "====> Change to zsh"
chsh -s /bin/zsh
zsh

source ~/.zshrc
