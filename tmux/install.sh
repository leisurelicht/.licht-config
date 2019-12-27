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
brew install tmux
brew install reattach-to-user-namespace

# tmux
echo "====> Install tumx plugins manage plugin tpm"
if [ ! -d ~/.tmux/plugins/tpm ]; then
    mkdir -p ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "====> Back up dir path is: ${config_path}/bak"
if [ ! -d $config_path/bak ]; then
    mkdir -p $config_path/bak
fi

if [ -f ~/.tmux.conf ]; then
    echo "====> Tmux config file tmux.conf is exist, backup and delete it."
    mv ~/.tmux.conf $config_path/bak/tmux.conf.bak
fi
echo "====> Create tmux.conf link"
rm ~/.tmux.conf >/dev/null 2>&1
ln -s $config_path/tmux/tmux.conf ~/.tmux.conf
