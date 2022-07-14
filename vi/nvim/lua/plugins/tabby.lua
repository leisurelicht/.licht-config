-- ==============
-- tabby.lua --- tabline
-- Author: MuCheng
-- =================
--
local ok, tabby = pcall(require, "tabby")
if not ok then
	vim.notify("Load tabby Failed", "warn")
	return
end

local filename = require("tabby.module.filename")

require("utils.ui.colors")
local str = require("utils.strings")

local cwd = function()
	return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
end

tabby.setup({
	tabline = {
		hl = "TabLineFill",
		layout = "active_wins_at_tail",
		head = {
			{ cwd, hl = "LichtTLHead" },
			{ "", hl = "LichtTLHeadSep" },
		},
		active_tab = {
			label = function(tabid)
				return {
					"  " .. tabid .. " ",
					hl = "LichtTLActive",
				}
			end,
			left_sep = { "", hl = "LichtTLActiveSep" },
			right_sep = { "", hl = "LichtTLActiveSep" },
		},
		inactive_tab = {
			label = function(tabid)
				return {
					"  " .. tabid .. " ",
					hl = "LichtTLBoldLine",
				}
			end,
			left_sep = { "", hl = "LichtTLLineSep" },
			right_sep = { "", hl = "LichtTLLineSep" },
		},
		top_win = {
			label = function(winid)
                local win_name =  filename.unique(winid)
                if str.starts_with(win_name, "NvimTree") then
                    win_name = str.split(win_name, "_")[1]
                end
				return {
					"  " .. win_name .. " ",
					hl = "TabLine",
				}
			end,
			left_sep = { "", hl = "LichtTLLineSep" },
			right_sep = { "", hl = "LichtTLLineSep" },
		},
		win = {
			label = function(winid)
                local win_name =  filename.unique(winid)
                if str.starts_with(win_name, "NvimTree") then
                    win_name = str.split(win_name, "_")[1]
                end
				return {
					"  " .. win_name .. " ",
					hl = "TabLine",
				}
			end,
			left_sep = { "", hl = "LichtTLLineSep" },
			right_sep = { "", hl = "LichtTLLineSep" },
		},
		tail = {
			{ "", hl = "LichtTLHeadSep" },
			{ "  ", hl = "LichtTLHead" },
		},
	},
})

local map = require("utils.mapping")

map.set("n", "<leader>tmp", "<CMD>-tabmove<CR>", "Tab Move Previous")
map.set("n", "<leader>tmn", "<CMD>+tabmove<CR>", "Tab Move Next")
