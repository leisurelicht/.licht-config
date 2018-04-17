#
basepath=$(cd `dirname $0`; pwd)

if [ -e ~/.zshrc ]; then
    rm ~/.zshrc
fi
ln -s $basepath/zsh/zshrc ~/.zshrc


if [ -e ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s $basepath/vim/vimrc ~/.vimrc

if [ -e ~/.tmux.conf ]; then
    rm ~/.tmux.conf
fi
ln -s $basepath/tmux/tmux.conf ~/.tmux.conf

# 如果没有brew 安装brew
if [ ! command -v brew &>/dev/null ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew update
brew update
brew upgrde

# brew install 
brew install zsh
brew install autojump
brew install git
brew install tig
brew install ctags
brew install fzf
brew install ag
brew install go
brew install reattach-to-user-namespace
brew install wget
brew install tmux
brew install pyenv
brew install redis
brew install vim --with-lua --with-override-system-vi

# 配置fzf
gem install rough

# brew cask install 
brew cask install iterm2
brew cask install shadowsockesx
brew cask install docker 
brew cask install pyenv
brew cask install firefox
brew cask install google-chrome

# 切换shell
chsh -s /bin/zsh

pip install jedi
pip install autopep8

if [ command -v  curl &>/dev/null ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif [ command -v wget &>/dev/null ]; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# 安装vim-plug
vim -c PlugInstall

# tmux
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


















