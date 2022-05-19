-- =================
-- focus.lua --- focus config file
-- Author: MuCheng
-- =================
--
local ok, focus = pcall(require, "focus")
if not ok then
	vim.notify("Load focus Failed", "warn")
	return
end

focus.setup({
    signcolumn = false,
    excluded_filetypes = {"toggleterm"},
    compatible_filetrees = {"nvimtree"},
})

local wk = require("which-key")
wk.register({
	s = {
		name = "+Split",
        e = {"<CMD>FocusEnable<CR>", "Enable"},
        s = {"<CMD>FocusDisable<CR>", "Disable"},
		t = { "<CMD>FocusToggle<CR>", "Toggle Focus" },
		h = { "<CMD>FocusSplitLeft<CR>", "Left" },
		l = { "<CMD>FocusSplitRight<CR>", "Right" },
		j = { "<CMD>FocusSplitDown<CR>", "Down" },
		k = { "<CMD>FocusSplitUp<CR>", "Up" },
		m = { "<CMD>FocusMaximise<CR>", "Max" },
		n = { "<CMD>FocusEqualise<CR>", "Equal" },
	},
}, { prefix = "<leader>" })
