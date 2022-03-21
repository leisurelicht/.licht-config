-- =================
-- basic.lua --- 基础配置文件
-- Author: MuCheng
-- =================
--

-- 以下是neovim默认开启的配置
--
-- filetype on
-- 载入文件类型插件
-- filetype plugin on
-- 开启语法高亮
-- syntax enable
-- 允许使用制定高亮替换方案
-- syntax on
-- 修复delete键
-- set backspace=2
-- 始终显示状态拦
-- set laststatus=2
-- 输入搜索内容时就显示搜索结果
-- set incsearch
-- 搜索时高亮显示被找到的文本
-- set hlsearch
-- 有一个或以上大写字母时仍大小写敏感
-- set smartcase
-- 自动套用上一行的缩进方式
-- set autoindent
-- 智能缩进
-- set smartindent
-- 文件自动检测外部更改
-- set autoread
-- 让鼠标能使用
-- set mouse=a

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- 光标和顶部/底部保持8行的距离
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- 显示行号
vim.o.number = true
-- vim.wo.relativenumber = true

-- 高亮所在行
vim.o.cursorline = true

-- 使用backspace直接删除tab
vim.o.smarttab = true

-- mapping delays
vim.o.timeoutlen = 500

-- 关闭自动备份
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- 不在单词中间折行
vim.o.linebreak = true

-- 即时预览命令效果
vim.o.inccommand= 'split'

-- 系统剪贴板
vim.o.clipboard = 'unnamed'

-- 长度表示线
vim.wo.colorcolumn = '0'

-- 为特定文件类型载入相关缩进文件
vim.g.filetypeindent = 'on'

-- 右下角显示正在输入的命令
vim.o.showcmd = true

-- 分隔窗口在当前窗口下边
vim.o.splitbelow = true

-- 分隔窗口在当前窗口下边
vim.o.splitright = true

-- 警告时不要闪烁
vim.o.visualbell = false

-- 搜索时忽略大小写
vim.o.ignorecase = true

-- 有一个或以上大写字母时仍大小写敏感
vim.o.smartcase = true

-- 编辑的时候将所有的tab设置为空格
vim.bo.expandtab = true
vim.o.expandtab = true

-- 将tab换为4个空格
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true

-- 折叠方式
vim.g.foldmethod = "indent"
vim.g.foldlevelstart = 99

-- 自动补全不自动选中 
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 补全增强
vim.o.wildmenu = true

-- 样式
vim.opt.termguicolors = true
vim.o.termguicolors = true
vim.o.background = "dark"

-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = false
vim.o.listchars = "space:·,tab:>-,"

-- 
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10

-- 行结尾可以跳到下一行
vim.o.whichwrap = 'b,s,<,>,[,],h,l'

-- always show tabline
vim.o.showtabline = 2

-- 使用增强状态栏后不再需要 vim 的模式提示
-- vim.o.showmode = false

-- 隐藏未保存的buffer
-- vim.g.hidden = true

-- 不在单词中间折行
vim.o.linebreak = true