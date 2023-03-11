-- =================
-- init.lua -
-- Note: neovim init file
-- Author: MuCheng
-- =================
--

vim.g.HOME_PATH = vim.fn.expand("$HOME")
vim.g.CONFIG = vim.g.HOME_PATH .. "/.config_file/vi/nvim"
vim.o.runtimepath = vim.o.runtimepath .. "," .. vim.g.CONFIG

vim.notify = vim.pretty_print

require("lichtvim.core")
require("lichtvim.lazy")

-- 开发测试使用的精简插件配置
-- require("plugins_dev.dev1")
-- require("plugins_dev.dev2")
