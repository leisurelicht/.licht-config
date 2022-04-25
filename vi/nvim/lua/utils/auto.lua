-- =================
-- auto.lua --- 函数别名
-- Author: MuCheng
-- =================
--
local M = {}

local api = vim.api

M.augroup = api.nvim_create_augroup
M.autocmd = api.nvim_create_autocmd

return M
