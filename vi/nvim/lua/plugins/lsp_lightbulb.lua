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

lightbulb.setup({
    sign = {
        enabled = true,
        -- Priority of the gutter sign
        priority = 10,
    },
	autocmd = {
		enabled = true,
		pattern = { "*" },
		events = { "CursorHold", "CursorHoldI" },
	},
})

-- vim.fn.sign_define(
-- 	"LightBulbSign",
-- 	{ text = icons.lsp_hover.Action, texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
-- )

-- local api = require("utils.api")
-- api.autocmd({ "CursorHold", "CursorHoldI" }, {
-- 	pattern = { "*" },
-- 	callback = function()
-- 		require("nvim-lightbulb").update_lightbulb()
-- 	end,
-- })
