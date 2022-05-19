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
	excluded_filetypes = { "toggleterm" },
	compatible_filetrees = { "nvimtree" },
})

local wk = require("which-key")
wk.register({
	s = {
		name = "+Split",
		E = { "<CMD>FocusEnable<CR>", "Focus Enable" },
		D = { "<CMD>FocusDisable<CR>", "Focus Disable" },
		t = { "<CMD>FocusToggle<CR>", "Focus Toggle" },
		h = { "<CMD>FocusSplitLeft<CR>", "Focus Left" },
		l = { "<CMD>FocusSplitRight<CR>", "Focus Right" },
		j = { "<CMD>FocusSplitDown<CR>", "Focus Down" },
		k = { "<CMD>FocusSplitUp<CR>", "Focus Up" },
		m = { "<CMD>FocusMaximise<CR>", "Focus Max" },
		n = { "<CMD>FocusEqualise<CR>", "Focus Equal" },
	},
}, { prefix = "<leader>" })
