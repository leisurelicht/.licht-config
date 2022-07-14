-- =================
-- mapping.lua --- 快捷键映射
-- Author: MuCheng
-- =================
--
local Map = {}

Map.opts = { silent = true }

local function check_opts(opts)
	if opts == nil then
		opts = Map.opts
	elseif next(opts) == nil then
		opts = {}
	else
		opts = vim.tbl_extend("force", Map.opts, opts)
	end
	return opts
end

function Map.set(mode, lhs, rhs, desc, opts)
	opts = check_opts(opts)
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

function Map.mapKey(mode, lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

function Map.mapCmd(lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":" .. rhs .. "<cr>", opts)
end

function Map.mapCmdWait(lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":" .. rhs .. " ", opts)
end

function Map.mapLua(lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_set_keymap("n", lhs, ":lua " .. rhs .. "<cr>", opts)
end

function Map.mapBufKey(buf, mode, lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, opts)
end

function Map.mapBufLua(buf, lhs, rhs, opts)
	opts = check_opts(opts)
	vim.api.nvim_buf_set_keymap(buf, "n", lhs, ":lua " .. rhs .. "<cr>", opts)
end

return Map
