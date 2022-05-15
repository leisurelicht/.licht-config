-- ==============
-- lightbulb.lua --- 小灯泡
-- Author: MuCheng
-- =================
--
local ok, lightbulb = pcall(require, "nvim-lightbulb")
if not ok then
	vim.notify("Load nvim-lightbulb Failed", "warn")
	return
end

local icons = require("utils.icons")

lightbulb.setup({
	ignore = {},
	sign = {
		enabled = true,
		priority = 15,
	},
	float = {
		enabled = false,
		text = icons.lsp_hover.Action,
		win_opts = {},
	},
	virtual_text = {
		enabled = false,
		text = icons.lsp_hover.Action,
		hl_mode = "replace",
	},
	status_text = {
		enabled = false,
		text = icons.lsp_hover.Action,
		text_unavailable = "",
	},
})

vim.fn.sign_define(
	"LightBulbSign",
	{ text = icons.lsp_hover.Action, texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
)

vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
