# Mac配置

* 包含zsh、tmux、vim

## 基础配置

1. 安装brew和brew cask
    
2. 安装iterm2

        brew cask install iterm2

3. 安装zsh并设置默认shell为zsh
	
        brew install zsh
        chsh -s /bin/zsh

	重启iterm

4. 安装oh-my-zsh主题

5. 安装Powerline fonts
	
	iterm2 设置字体和符号都为Hack
    

	
## brew 安装的软件

    zsh
    wget
    autojump
    vim
    git
    tig
    ctags
    fzf
    ag
    go

## brew cask 安装的软件

    iterm2
    java
    shadowsockesx




## vim配置

* vimrc 

        ln -s ~/.config_file/vim/vimrc ~/.vimrc

* plug.vim

        第三方插件配置文件

* conf.vim

        vim配置文件

* func.vim

        自定义的vim函数

## zsh配置

* zshrc

        ln -s ~/.config_file/zsh/zshrc ~/.zshrc

* oh-my-zsh 插件

        autojump
        zsh-syntax-highlighting

* aliasrc文件

	    填写所有的alias配置

## tmux配置




