-- =================
-- basic.lua
-- Note: neovim 基础设置
-- =================
--
local sys = require("utils").sys

if sys.IsMacOS() then
  vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")
elseif sys.IsLinux() then
  vim.api.nvim_set_var("python3_host_prog", "python3")
end

if sys.IsNeovide() then
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_input_use_logo = false
  vim.g.neovide_no_idle = true
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0
  vim.opt.guifont = {"FiraCode Nerd Font", ":h12"}
end

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- 修复delete键
-- set backspace=2
-- 始终显示状态拦
-- set laststatus=2
-- 输入搜索内容时就显示搜索结果
-- set incsearch
-- 搜索时高亮显示被找到的文本
-- set hlsearch
-- 文件自动检测外部更改
-- set autoread
-- 让鼠标能使用
-- set mouse=a
-- 开启语法高亮
vim.cmd([[syntax enable]])
-- 开启文件类型检查
vim.cmd([[filetype plugin indent on]])

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- 设定在无操作时，交换文件刷写到磁盘的等待毫秒数（默认为 4000）
vim.o.updatetime = 100

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
vim.o.inccommand = "split"

-- 系统剪贴板
vim.o.clipboard = "unnamedplus"

-- 长度表示线
vim.wo.colorcolumn = "0"

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

-- 有一个或以上大写字母时仍大小写敏感
vim.o.smartcase = true

-- 自动套用上一行的缩进方式
vim.o.autoindent = true

-- 智能缩进
vim.o.smartindent = true

-- 编辑的时候将所有的tab设置为空格
vim.o.expandtab = true

-- 将tab换为4个空格
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true

-- 折叠方式
vim.g.foldmethod = "indent"
vim.g.foldlevelstart = 99

-- 自动补全不自动选中
vim.o.completeopt = "menuone,noselect,noinsert"

-- 补全增强
vim.o.wildmenu = true

-- 样式
vim.o.termguicolors = true
vim.o.background = "dark"

-- 不可见字符的显示
vim.o.list = false
-- vim.o.listchars = "space:·,tab:>-,"

--
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.pumheight = 10

-- 行结尾可以跳到下一行
vim.o.whichwrap = "b,s,<,>,[,],h,l"

-- always show tabline
vim.o.showtabline = 2

-- 是否开启单词拼写检查
vim.o.spell = true
-- 设定单词拼写检查的语言
vim.o.spelllang = "en_us,cjk"

-- 使用增强状态栏后不再需要 vim 的模式提示
-- vim.o.showmode = false

-- 隐藏未保存的buffer
-- vim.g.hidden = true

-- set gui font
vim.o.guifont = "Hack Nerd Font"
