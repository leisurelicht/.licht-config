#! #!/usr/bin/env bash

function install_from_file(){
    while read -r line
    do 
        if [[ ! $line =~ "#" ]]; then
            `$2 $3 $4 $line`
        fi
    done < $1
}

if [[ $1 == "add" ]];then
    echo '增量更新'
    if [[ $2 == "all" || -z $2 ]]; then
        install_from_file ./brew_install brew install
        install_from_file ./brew_cask_install brew cask install
    fi
    if [[ $2 == "brew" ]]; then
        install_from_file ./brew_install brew install
    fi
    if [[ $2 == "brewcask" ]]; then
        install_from_file ./brew_cask_install brew cask install
    fi
fi

if [[ $1 == "upgrade" ]]; then
    if [[ $2 == "all" || -z $2 ]]; then
        echo "开始用brew 更新命令行软件。"
        install_from_file ./brew_install brew upgrade
        echo "开始用brew cask 更新图形界面软件。"
        install_from_file ./brew_cask_install brew cask upgrade
    fi

    if [[ $2 == "brew" ]]; then
        echo "开始用brew 更新命令行软件。"
        install_from_file ./brew_install brew upgrade
    fi
    if [[ $2 == "brewcask" ]]; then
        echo "开始用brew cask 更新图形界面软件。"
        install_from_file ./brew_cask_install brew cask upgrade
    fi
fi

