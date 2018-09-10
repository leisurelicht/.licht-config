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
    echo "====> Commnad brew is already install"
fi

echo "====> Use brew to intall necessary"
brew install zsh
brew install fzf
brew install autojump
brew install go
brew install python

# 安装oh-my-zsh
echo "====> Install oh-my-zsh"
if command -v curl >/dev/null 2>&1; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif command -v wget >/dev/null 2>&1; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# 创建备份文件
echo "====> Back up dir path is: ${config_path}/bak"
if [ ! -d $config_path/bak ]; then
    mkdir -p $config_path/bak
fi

if [ -f ~/.zshrc ]; then
    echo "====> Zsh config file zshrc is exist, backup and delete it."
    mv ~/.zshrc $config_path/bak/zshrc.bak
fi
echo "====> Create zshrc link"

rm ~/.zshrc >/dev/null 2>&1
ln -s $config_path/zsh/zshrc ~/.zshrc
