-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.relativenumber = false
vim.opt.guifont = "Hack Nerd Font" -- set gui font
vim.opt.list = true -- 显示特殊字符
vim.opt.listchars = { tab = "  ", extends = "❯", precedes = "❮" } -- 字符转换

-- autoformat
vim.g.autoformat = false
