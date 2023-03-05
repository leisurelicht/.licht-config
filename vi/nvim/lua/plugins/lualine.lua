-- =================
-- lualine.lua --- 状态栏配置
-- Author: MuCheng
-- =================
--
local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.notify("Load lualine Failed", "warn")
	return
end

local icons_d = require("utils.ui.icons").diagnostics
local shortcut = require("utils.shortcut")

local function window_num()
	-- local num = vim.inspect([[%{tabpagewinnr(tabpagenr())}]])
	local num = [[%{winnr()}]]
	return "[" .. num .. "]"
end

lualine.setup({
	options = { theme = "nightfox" },
	sections = {
		lualine_a = {
			-- {
			-- 	"tabs",
			-- 	separator = { right = "" },
			-- },
			{
				window_num,
				separator = { right = "" },
				color = { fg = "white", bg = "grey" },
			},
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 1)
				end,
			},
		},
		lualine_c = {
			{
				shortcut.get_project_name,
			},
			"filename",
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = {
			{
				"diagnostics",
				-- Table of diagnostic sources, available sources are:
				--   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
				-- or a function that returns a table as such:
				--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
				sources = { "nvim_diagnostic", "nvim_lsp" },

				-- Displays diagnostics for the defined severity types
				sections = { "error", "warn", "info", "hint" },

				diagnostics_color = {
					-- Same values as the general color option can be used here.
					error = "DiagnosticError", -- Changes diagnostics' error color.
					warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
					info = "DiagnosticInfo", -- Changes diagnostics' info color.
					hint = "DiagnosticHint", -- Changes diagnostics' hint color.
				},
				symbols = { error = icons_d.Error, warn = icons_d.Warn, info = icons_d.Info, hint = icons_d.Hint },
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
				separator = { left = "" },
			},
			{
				"progress",
				separator = { left = "" },
			},
		},
	},
	inactive_sections = {
		lualine_a = {
			-- {
			-- 	"tabs",
			-- 	separator = { right = "" },
			-- },
			{
				window_num,
				separator = { right = "" },
				color = { fg = "white", bg = "grey" },
			},
		},
	},
	extensions = { "nvim-tree", "symbols-outline", "fzf" },
})
