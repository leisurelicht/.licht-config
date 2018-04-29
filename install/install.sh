#
basepath=$(
    cd $(dirname $0)
    pwd
)

# 如果没有brew 安装brew
if [ ! command -v brew ] &>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

source brew_install.sh
source brew_cask_install.sh

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

ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

ln -s $basepath/tmux/tmux.conf ~/.tmux.conf

# 配置fzf
gem install rough

# 切换shell
chsh -s /bin/zsh

/usr/local/bin/pip3 install jedi
/usr/local/bin/pip3 install neovim
/usr/local/bin/pip3 install --upgrade --user autopep8
/usr/local/bin/pip3 install yapf

/usr/local/bin/pip install jedi
/usr/local/bin/pip install --upgrade --user autopep8
/usr/local/bin/pip install yapf
/usr/local/bin/pip install neovim
/usr/local/bin/pip install flake8

if [ command -v curl ] &>/dev/null; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif [ command -v wget ] &>/dev/null; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# 安装
vim -c PlugInstall

# tmux
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
