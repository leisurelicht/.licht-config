-- =================
-- nvim-neoclip.lua --- neoclip config file
-- Author: MuCheng
-- =================
--
local ok, neoclip = pcall(require, "neoclip")
if not ok then
	vim.notify("Load nvim-neoclip Failed", "warn")
	return
end

local function is_whitespace(line)
	return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
	for _, entry in ipairs(tbl) do
		if not check(entry) then
			return false
		end
	end
	return true
end

neoclip.setup({
	history = 1000,
	enable_persistent_history = true,
	continuous_sync = true,
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
	filter = function(data)
		return not all(data.event.regcontents, is_whitespace)
	end,
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<a-p>",
				past_behind = "<a-o>",
				replay = "<nop>",
				delete = "<c-d>",
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "<nop>",
				delete = "dd",
				custom = {},
			},
		},
	},
})

local wk = require("which-key")
wk.register({
	["fp"] = { "<CMD>Telescope neoclip a extra=star,plus,b theme=dropdown<CR>", "Paster" },
}, {prefix="<leader>"})
