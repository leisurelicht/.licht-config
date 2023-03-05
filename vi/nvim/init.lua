-- =================
-- init.lua --- neovim init file
-- Author: MuCheng
-- =================
--

vim.g.HOME_PATH = vim.fn.expand("$HOME")
vim.g.CONFIG = vim.g.HOME_PATH .. "/.config_file/vi/nvim"
vim.o.runtimepath = vim.o.runtimepath .. "," .. vim.g.CONFIG

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- set nvim python interpreter
-- vim.api.nvim_set_var('python2_host_prog', '/usr/local/bin/python2')

local sys = require("utils.sys")

if sys.IsMacOS then
	vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")
elseif sys.IsLinux then
	vim.api.nvim_set_var("python3_host_prog", "python3")
end

vim.notify = vim.pretty_print

require("core")
require("plugins")
require("autoload")

-- 开发测试使用的精简插件配置
-- require("plugins_dev.dev1")
-- require("plugins_dev.dev2")
