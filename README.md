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

## What this repository doing

- manage, save my computer environment and soft config

- Primarily for macOS, and sometimes use on ubuntu.

- Include
  - kitty configurations
  - tmux configurations
  - a simple vim configurations in one file
  - a custom neovim configurations base on [LazyVim](https://github.com/LazyVim/LazyVim).
  - zsh configurations
  - the installation and uninstallation script for all the configurations mentioned above

## File structure

```text
.
├── bak
├── installed // brew install soft list
├── kitty // kitty configuration
├── LICENSE
├── README.md
├── tmux // tmux configuration
├── vi // vim & neovim configuration
└── zsh // zsh configuration

```

## Usage

### Clone repository

```bash
git clone --depth=1 https://github.com/leisurelicht/.licht-config.git
```

### Kitty

#### Usage

- install

  ```bash
  ./install.sh kitty
  ```

- uninstall

  ```bash
  ./uninstall.sh kitty
  ```

#### File structure

```text
.
└── kitty.conf
```

----

### Zsh

#### Usage

- install

  ```bash
  ./install.sh zsh
  ```

  - change terminal font to Hack Nerd Font
  - if you're using iTerm2, you can refer to the following configuration.

  ![image](https://user-images.githubusercontent.com/8042345/246595065-19313c00-7f70-4cf8-ba12-ba9b2a56ddb4.png)

- uinstall

  ```bash
  ./uninstall.sh zsh
  ```

#### File structure

```text
└── zsh
   ├── aliasrc // command aliasrc
   ├── export_env // environment 
   ├── fzf.zsh // fzf configuration file
   ├── install.sh 
   ├── p10k.zsh // p10k configuration file
   ├── README.md
   └── zshrc // zsh configuration file
```

----

### Tmux

#### Preview

![image](https://user-images.githubusercontent.com/8042345/237138258-77ff0ece-31fe-4113-9cfe-cb742fe44685.png)

#### Usage

- install

  1. run install script

  ```bash
  ./install.sh tmux
  ```

  2. run tmux and install tmux plugins

  ```bash
  tmux
  <C-b>I
  ```

- uninstall

  ```bash
  ./uninstall.sh tmux
  ```

#### File structure

  ``` shell
  .
  ├── install.sh // install script
  ├── README.md
  ├── tmux.conf // tmux configuration
  └── uninstall.sh // uninstall configuration
  ```

#### Common key mapping

- **C = Ctrl = Control**
- **pk = Prefix Key = \<Ctrl-b\>**

|  *  |     key     |                                                      description |
| :-: |    :--:     |                                                              --: |
| --> |   session   |                                                                  |
|     |    pk-d     |                                        detach the current client |
|     |    pk-w     |                                      choose a window from a list |
|     |    pk-r     |                                        reload tmux configuration |
|     |    pk-I     |                                             install tmux plugins |
|     |    pk-i     |                                              display window info |
| --> |   window    |                                                                  |
|     |     C-d     |                                        quit but not close client |
|     |    pk-c     |                                              create a new window |
|     |    pk-&     |                                          kill the current window |
|     |    pk-n     |                                           select the next window |
|     |    pk-p     |                                       select the previous window |
|     |    pk-f     |                                                search for a pane |
|     |  pk-number  |                                select a window based on a number |
|     |    pk-'     |                                select a window based on a number |
|     |    pk-,     |                                        rename the current window |
|     |    pk->     |                                              scroll preview left |
|     |    pk-<     |                                             scroll preview right |
| --> |    pane     |                                                                  |
|     |     C-d     |                                           close the current pane |
|     |    pk-x     |                                             kill the active pane |
|     |    pk-\\    |                                       create a pane horizontally |
|     |    pk-%     |                                       create a pane horizontally |
|     |  pk-&#124;  |                      create a pane horizontally on the far right |
|     |    pk-"     |                                         create a pane vertically |
|     |    pk--     |                                         create a pane vertically |
|     |    pk-_     |                      create a pane vertically on the very bottom |
|     |    pk-;     |                               move to the previously active pane |
|     |    pk-q     |                                    show the number for each pane |
|     |    pk-z     |                                             zoom the active pane |
|     |    pk-h     |                                 move the cursor to the left pane |
|     |    pk-l     |                                move the cursor to the right pane |
|     |    pk-j     |                                move the cursor to the below pane |
|     |    pk-k     |                                move the cursor to the above pane |
|     |    pk-H     |                                resize the current pane left by 5 |
|     |    pk-L     |                               resize the current pane right by 5 |
|     |    pk-J     |                                resize the current pane down by 5 |
|     |    pk-K     |                                  resize the current pane up by 5 |
|     |    pk-!     |                            move the current pane to a new window |
|     |    pk-o     |                      move to the next pane in the current window |
|     |    pk-{     |                         swap the active pane with the pane above |
|     |    pk-}     |                         swap the active pane with the pane below |
|     |  pk-Alt+o   |                              rotate through the panes in reverse |
|     |  pk-Ctrl+o  |                           rotate through the panes in clockwise  |
| --> |    Other    |                                                                  |
|     |    pk-t     |                                         show time in full screen |

----

### Vim && Neovim

#### Usage

- install

  ```bash
  ./install.sh [vim/neovim]
  ```

- 卸载

  ```bash
  ./uninstall.sh [vim/neovim]
  ```
  
#### File structure

```text
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
