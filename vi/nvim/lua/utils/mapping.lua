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

return M
