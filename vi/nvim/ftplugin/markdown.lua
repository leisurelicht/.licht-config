vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }

vim.opt_local.list = true
vim.opt_local.listchars:append("space:·")
vim.opt_local.listchars:append("eol:↴")
