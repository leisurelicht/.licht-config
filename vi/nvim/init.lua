-- =================
-- init.lua --- neovim init file
-- Author: MuCheng
-- =================
--

vim.g.HOME_PATH = vim.fn.expand('$HOME')
vim.g.CONFIG = vim.g.HOME_PATH.."/.config_file/vi/nvim"
vim.o.runtimepath = vim.o.runtimepath..","..vim.g.CONFIG

-- vim.api.nvim_set_var('python2_host_prog', '/usr/local/bin/python2')
vim.api.nvim_set_var('python3_host_prog', '/opt/homebrew/bin/python3')

require('core')
require('plugins')

-- 设置所使用的主题
vim.cmd([[colorscheme onedark]])



-- TODO List
-- marks 快捷键
-- notify 搜索窗口样式问题
-- lsp


-- 代码片段
-- 输出绑定的 normal 类型快捷键
-- print(vim.inspect(vim.api.nvim_get_keymap('n')))
-- 输出文件类型
-- print(vim.bo.filetype)
-- 输出所有 vim 支持的方法
-- print(vim.inspect(vim))
