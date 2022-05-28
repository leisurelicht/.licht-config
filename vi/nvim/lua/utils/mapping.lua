-- =================
-- mapping.lua --- 快捷键映射
-- Author: MuCheng
-- =================
--
local M = {}

M.opts = { silent = true }

local function check_opts(opts)
	if opts == nil then
		opts = M.opts
	elseif next(opts) == nil then
		opts = {}
	else
		opts = vim.tbl_extend("force", M.opts, opts)
	end
	return opts
end

function M.set(mode, lhs, rhs, desc, opts)
	opts = check_opts(opts)
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

function M.mapKey(mode, lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function M.mapCmd(lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":" .. rhs .. "<cr>", opts)
end

function M.mapCmdWait(lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":" .. rhs .. " ", opts)
end

function M.mapLua(lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":lua " .. rhs .. "<cr>", opts)
end

function M.mapBufKey(buf, mode, lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, opts)
end

function M.mapBufLua(buf, lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_buf_set_keymap(buf, "n", lhs, ":lua " .. rhs .. "<cr>", opts)
end

return M
