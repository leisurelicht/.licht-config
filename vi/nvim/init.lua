-- =================
-- init.lua --- neovim init file
-- Author: MuCheng
-- =================
--
vim.g.HOME_PATH = vim.fn.expand("$HOME")
vim.g.CONFIG = vim.g.HOME_PATH .. "/.config_file/vi/nvim"
vim.o.runtimepath = vim.o.runtimepath .. "," .. vim.g.CONFIG

-- set nvim python interpreter
-- vim.api.nvim_set_var('python2_host_prog', '/usr/local/bin/python2')
vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")

vim.notify = vim.pretty_print

require("core")
require("plugins")

-- 开发测试使用的精简插件配置
-- require("plugins_dev.dev1")
-- require("plugins_dev.dev2")
