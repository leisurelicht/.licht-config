-- =================
-- key.lua --- 快捷键函数
-- Author: MuCheng
-- =================
--
local M = {}

-- keys.smap = vim.api.nvim_set_keymap
-- keys.gmap = vim.api.nvim_get_keymap
-- keys.dmap = vim.api.nvim_del_keymap

-- key.bsmap = vim.api.nvim_buf_set_keymap
-- key.bgmap = vim.api.nvim_buf_get_keymap
-- key.bdmap = vim.api.nvim_buf_del_keymap

M.opts = { noremap = true, silent = true }

local function checkOpts(opts)
	if opts == nil then
		opts = M.opts
	elseif next(opts) == nil then
		opts = {}
	else
		opts = vim.tbl_extend("force", M.opts, opts)
	end
	return opts
end

function M.mapKey(mode, lhs, rhs, opts)
	opts = checkOpts(opts)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function M.mapCmd(lhs, rhs, opts)
	opts = checkOpts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":" .. rhs .. "<cr>", opts)
end

function M.mapCmdWait(lhs, rhs, opts)
	opts = checkOpts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":" .. rhs .. " ", opts)
end

function M.mapLua(lhs, rhs, opts)
	opts = checkOpts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":lua " .. rhs .. "<cr>", opts)
end

function M.mapBufKey(buf, mode, lhs, rhs, opts)
	opts = checkOpts(opts)
	vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, opts)
end

function M.mapBufLua(buf, lhs, rhs, opts)
	opts = checkOpts(opts)
	vim.api.nvim_buf_set_keymap(buf, "n", lhs, ":lua " .. rhs .. "<cr>", opts)
end

return M
