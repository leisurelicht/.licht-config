-- =================
-- init.lua --- neovim init file
-- Author: MuCheng
-- =================
--

vim.g.HOME_PATH = vim.fn.expand('$HOME')
vim.g.CONFIG = vim.g.HOME_PATH.."/.config_file/vi/nvim"
vim.o.runtimepath = vim.o.runtimepath..","..vim.g.CONFIG


require('core')
require('plugins')
-- require('lsp')

-- 设置所使用的主题
vim.cmd([[colorscheme onedark]])


-- 代码片段
-- 输出绑定的 normal 类型快捷键
-- print(vim.inspect(vim.api.nvim_get_keymap('n')))
-- 输出文件类型
-- print(vim.bo.filetype)
-- 输出所有 vim 支持的方法
-- print(vim.inspect(vim))
