vim.bo.expandtab = true
vim.bo.fileformat = "unix"
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }

vim.o.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:↴")
