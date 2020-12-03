
# Tmux 配置

----

* 安装过程

  * 运行tmux/install.sh

----

* 文件结构

  * tmux.conf

        tmux配置文件

  * install.sh

        安装脚本

  * README.md

----

* 快捷键

  * **Prefix-key = Ctrl-b**

    |*|快捷键|功能|
    |-|------|----|
    |*|session相关||
    ||pk-d|退出tmux但不关闭session|
    ||pk-w|总览所有session|
    |*|window相关||
    ||C-d|关闭当前window|
    ||pk-c|创建新的window|
    ||pk-&|强制删除当前window|
    ||pk-n|移动向下一个window|
    ||pk-p|移动向前一个window|
    ||pk-f|搜索window|
    ||pk-数字|根据数字选择window|
    ||pk-'|根据数字选择window|
    ||pk-,|重命名window|
    ||pk->|将window排序后移一位|
    ||pk-<|将window排序前移一位|
    |*|pane相关||
    ||C-d|关闭当前pane|
    ||pk-x|强制关闭当前pane|
    ||pk-"|水平分割创建pane|
    ||pk-\|水平分割创建pane|
    ||pk-||全局范围水平分割创建pane|
    ||pk-%|垂直分割创建pane|
    ||pk--|垂直分割创建pane|
    ||pk-_|全局范围垂直分割创建pane|
    ||pk-q|显示每个pane的编号|
    ||pk-z|全屏/缩小当前pane|
    ||pk-h|移动到左边的pane|
    ||pk-l|移动到右边的pane|
    ||pk-j|移动到下边的pane|
    ||pk-k|移动到上边的pane|
    ||pk-H|向左调整当前pane大小|
    ||pk-L|向右调整当前pane大小|
    ||pk-J|向上调整当前pane大小|
    ||pk-K|向下调整当前pane大小|
    ||pk-!|将当前pane置于新window; 即新建一个window，其中仅包含当前pane|
    ||pk-o|在当前window中选择下一pane|
    ||pk-{|向前置换当前pane, 光标会跟随pane|
    ||pk-}|向后置换当前pane, 光标会跟随pane|
    ||pk-Alt+o|逆时针旋转当前window的pane, 光标不会跟随pane|
    ||pk-Ctrl+o|顺时针旋转当前window的pane, 光标不会跟随pane|
    |*|其他||
    ||pk-t|全屏显示时间|
    ||pk-f|在所有window中查找指定文本|
