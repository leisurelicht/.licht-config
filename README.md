<h1 align="center">
  我的配置集合
</h1>

<h4 align="center">
  <a href="https://github.com/leisurelicht/.licht-config#kitty">Kitty</a>
  ·
  <a href="https://github.com/leisurelicht/.licht-config#zsh">Zsh</a>
  ·
  <a href="https://github.com/leisurelicht/.licht-config#tmux">Tmux</a>
  ·
  <a href="https://github.com/leisurelicht/.licht-config#vim--neovima">Vim&Neovim</a>
</h4>

<div align="center"><p>
    <a href="https://github.com/leisurelicht/.licht-config/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/leisurelicht/.licht-config?style=flat-square&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/leisurelicht/.licht-config/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/leisurelicht/.licht-config?style=flat-square&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/leisurelicht/.licht-config/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/leisurelicht/.licht-config?style=flat-square&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/leisurelicht/.licht-config">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/leisurelicht/.licht-config?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=flat-square&logoColor=D9E0EE&labelColor=302D41" />
    </a>
</div>

## 这个项目是干什么的 

- 管理，保存我的环境和软件的配置

- 主要在 macos 上使用, 部分时间在 ubuntu 上使用

- 内部包含
  - kitty 配置文件
  - tmux 配置文件
  - 一个简化的 vim 配置文件
  - 一个 neovim 的启动器，用于启动 LichtVim 配置。
  - zsh 配置文件
  - 以上所有配置的安装及卸载脚本

## 文件结构

```
.
├── bak
├── install // brew 安装的软件列表
├── kitty // kitty 配置
├── LICENSE
├── README.md
├── tmux // tmux 配置
├── vi // vim & neovim 配置
└── zsh // zsh 配置

```

## 使用说明文档

### 克隆本项目

```
git clone --depth=1 https://github.com/leisurelicht/.licht-config.git
```

### Kitty

#### Usage

* 安装
  ```
  ./install.sh kitty
  ```

* 卸载
  ```
  ./uninstall.sh kitty
  ```

#### 文件结构

```
.
└── kitty.conf
```

----

### Zsh 

#### Usage

* 安装
  ```
  ./install.sh zsh
  ```
  * 修改 terminal 字体为 Hack Nerd Font

* 卸载
  ```
  ./uninstall.sh zsh
  ```

#### 文件结构

```
└── zsh
   ├── aliasrc // 命令别名
   ├── export_env // 环境变量
   ├── fzf.zsh // fzf 配置文件
   ├── install.sh 
   ├── p10k.zsh // p10k 配置文件
   ├── README.md
   └── zshrc // zsh 配置文件
```

----

### Tmux

#### 预览

![image](https://user-images.githubusercontent.com/8042345/237138258-77ff0ece-31fe-4113-9cfe-cb742fe44685.png)

#### Usage

* 安装
  1. 运行安装脚本
  ```bash
  ./install.sh tmux
  ```
  2. 进入tmux，安装 tmux 插件
  ```bash
  tmux
  <C-b>I
  ```
* 卸载
  ```bash
  ./uninstall.sh tmux
  ```

#### 文件结构

  ``` shell
  .
  ├── install.sh // 安装脚本
  ├── README.md
  ├── tmux.conf // tmux 配置文件
  └── uninstall.sh // 卸载脚本
  ```

#### 快捷键

* **C = Ctrl = Control**
* **pk = Prefix Key = \<Ctrl-b\>**

| * | 快捷键      |                                                         功能 |
| - | --          |                                                           -- |
| * | session相关 |                                                              |
|   | pk-d        |                                      退出tmux但不关闭session |
|   | pk-w        |                                              总览所有session |
|   | pk-r        |                                               重载 tmux 配置 |
|   | pk-I        |                                               安装 tmux 插件 |
|   | pk-i        |                                               显示 tmux 信息 |
| * | window相关  |                                                              |
|   | C-d         |                                               关闭当前window |
|   | pk-c        |                                               创建新的window |
|   | pk-&        |                                           强制删除当前window |
|   | pk-n        |                                           移动向下一个window |
|   | pk-p        |                                           移动向前一个window |
|   | pk-f        |                                                   搜索window |
|   | pk-数字     |                                           根据数字选择window |
|   | pk-'        |                                           根据数字选择window |
|   | pk-,        |                                                 重命名window |
|   | pk->        |                                         将window排序后移一位 |
|   | pk-<        |                                         将window排序前移一位 |
| * | pane相关    |                                                              |
|   | C-d         |                                                 关闭当前pane |
|   | pk-x        |                                             强制关闭当前pane |
|   | pk-"        |                                             水平分割创建pane |
|   | pk-\\       |                                             水平分割创建pane |
|   | pk-\|       |                                     全局范围水平分割创建pane |
|   | pk-%        |                                             垂直分割创建pane |
|   | pk--        |                                             垂直分割创建pane |
|   | pk-_        |                                     全局范围垂直分割创建pane |
|   | pk-q        |                                           显示每个pane的编号 |
|   | pk-z        |                                            全屏/缩小当前pane |
|   | pk-h        |                                             移动到左边的pane |
|   | pk-l        |                                             移动到右边的pane |
|   | pk-j        |                                             移动到下边的pane |
|   | pk-k        |                                             移动到上边的pane |
|   | pk-H        |                                         向左调整当前pane大小 |
|   | pk-L        |                                         向右调整当前pane大小 |
|   | pk-J        |                                         向上调整当前pane大小 |
|   | pk-K        |                                         向下调整当前pane大小 |
|   | pk-!        | 将当前pane置于新window; 即新建一个window，其中仅包含当前pane |
|   | pk-o        |                                   在当前window中选择下一pane |
|   | pk-{        |                             向前置换当前pane, 光标会跟随pane |
|   | pk-}        |                             向后置换当前pane, 光标会跟随pane |
|   | pk-Alt+o    |                 逆时针旋转当前window的pane, 光标不会跟随pane |
|   | pk-Ctrl+o   |                 顺时针旋转当前window的pane, 光标不会跟随pane |
| * | 其他        |                                                              |
|   | pk-t        |                                                 全屏显示时间 |
|   | pk-f        |                                   在所有window中查找指定文本 |

----

### Vim && Neovim

#### Usage

* 安装
  ```
  ./install.sh [vim/neovim]
  ```

* 卸载
  ```
  ./uninstall.sh [vim/neovim]
  ```
  
#### 文件结构

```
.
├── nvim
│  ├── ftplugin
│  ├── init.lua
│  ├── lazy-lock.json
│  ├── lua
│  └── plugin
└── vim
   ├── autoload
   ├── config
   ├── custom
   ├── extends
   └── vimrc
```
