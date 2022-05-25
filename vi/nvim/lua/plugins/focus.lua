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

local map = require("utils.mapping")
map.set("n", "<leader>sE", "<CMD>FocusEnable<CR>", "Focus Enable")
map.set("n", "<leader>sD", "<CMD>FocusDisable<CR>", "Focus Disable")
map.set("n", "<leader>st", "<CMD>FocusToggle<CR>", "Focus Toggle")
map.set("n", "<leader>sh", "<CMD>FocusSplitLeft<CR>", "Focus Left")
map.set("n", "<leader>sl", "<CMD>FocusSplitRight<CR>", "Focus Right")
map.set("n", "<leader>sj", "<CMD>FocusSplitDown<CR>", "Focus Down")
map.set("n", "<leader>sk", "<CMD>FocusSplitUp<CR>", "Focus Up")
map.set("n", "<leader>sm", "<CMD>FocusMaximise<CR>", "Focus Max")
map.set("n", "<leader>sn", "<CMD>FocusEqualise<CR>", "Focus Equal")
