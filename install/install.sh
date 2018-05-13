basepath=$(
  cd $(dirname $0)/..
  pwd
)
echo "配置文件根目录为: ${basepath}"

if ! command -v brew >/dev/null 2>&1; then
    echo "brew is not be installed, start to install"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "brew is already install"
fi

echo "update brew and run doctor"
brew update
brew doctor

echo "use brew to intall necessary"
brew install zsh
brew install vim --with-override-vi
brew install node
brew install go
brew install fzf
brew install ctags
brew install ag
brew install tmux
brew install autojump

function install_from_file(){
    while read -r line
    do
        if [[ ! $line =~ "#" ]]; then
            `$2 $3 $4 $line`
        fi
    done < $1
}

for parm in $@; do
    if [[ param == "brew" ]];then
        echo "开始用brew 安装命令行软件。"
        install_from_file ./brew_install brew install
    fi

    if [[ param == "brewcask" ]]; then
        echo "开始用brew cask 安装图形界面软件。"
        install_from_file ./brew_cask_install brew cask install
    fi

echo "开始用Python 包管理器pip 安装第三方包。"
install_from_file ./pip_install /usr/local/bin/pip3 install
install_from_file ./pip3_install /usr/local/bin/pip install

echo "开始用Ruby 包管理器gem 安装第三方包。"
install_from_file ./gem_install gem install

echo "开始用node 包管理器npm 安装第三方包。"
install_from_file ./npm_install npm install -g

echo "开始用Go 包管理器安装第三方包。"
install_from_file ./go_install go get -u

mkdir $basepath/bak

if [ -e ~/.zshrc ]; then
    echo "zshrc file is exist, backup and delete it."
    mv ~/.zshrc $basepath/bak/
fi
ln -s $basepath/zsh/zshrc ~/.zshrc

if [ -e ~/.vimrc ]; then
    echo "vimrc file is exist, backup and delete it."
    mv ~/.vimrc $basepath/bak/
fi
ln -s $basepath/vim/vimrc ~/.vimrc

if [ -e ~/.tmux.conf ]; then
    echo "tmux.conf file is exist, backup and delete it."
    mv ~/.tmux.conf $basepath/bak/
fi
ln -s $basepath/tmux/tmux.conf ~/.tmux.conf

if [ ! -d ~/.config/ ]; then
    mkdir ~/.config/
fi

if [ -d ~/.config/nvim ]; then
    echo "nvim dir is exist, backup and delete it."
    mv ~/.config/nvim $basepath/bak/
fi
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# 切换shell
chsh -s /bin/zsh

# 安装oh-my-zsh
if command -v curl >/dev/null 2>&1; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif command -v wget >/dev/null 2>&1; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# tmux
if [ ! -d ~/.tmux/plugins/tpm ]; then
    mkdir -p ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


# 安装vim插件
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall

