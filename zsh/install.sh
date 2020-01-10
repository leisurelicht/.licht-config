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
brew install autojump
brew install fzf
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install pyenv
$(brew --prefix)/opt/fzf/install --all
brew install ag

echo "====> Use Gem to install necessary"
gem install rough

# 安装oh-my-zsh
echo "====> Install oh-my-zsh"
if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif command -v wget >/dev/null 2>&1; then
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# 备份文件
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

# download zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 安装 Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# 切换到zsh
chsh -s /bin/zsh
