-- =================
-- neoformat.lua --- neoformat config file
-- Author: MuCheng
-- =================
--
-- 1.自动对齐
vim.g.neoformat_basic_format_align = 1
-- 2.自动删除行尾空格
vim.g.neoformat_basic_format_trim = 1
-- 3.将制表符替换为空格
vim.g.neoformat_basic_format_retab = 0
-- 只提示错误消息
vim.g.neoformat_only_msg_on_error = 1

-- vim.cmd([[
-- let g:neoformat_lua_luafmt = {
--   \ 'exe': 'luafmt',
--   \ 'args': ['-i 2', ],
--   \ }
-- ]])

vim.g.neoformat_lua_luafmt = {
  exe = "luafmt",
  args = {"-i 2"}
}

vim.g.neoformat_enabled_golang = {"gofumpt", "gofmt", "goimports"}
vim.g.neoformat_enabled_lua = {"luafmt"}
vim.g.neoformat_enabled_python = {"yapf", "autopep8", "isort"}
vim.g.neoformat_enabled_c = {"clang-format"}

local auto = require("utils.auto")
local format = auto.augroup("Preat", {clear = true})
auto.autocmd(
  {"BufWritePre"},
  {
    pattern = {"*"},
    command = "undojoin | Neoformat",
    group = format
  }
)

local wk = require("which-key")
wk.register({["nf"] = {"<CMD>Neoformat<CR>", "Format"}}, {prefix = "<leader>"})
