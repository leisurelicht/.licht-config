-- =================
-- bufferline.lua --- bufferline config file
-- Author: MuCheng
-- =================
--
local ok, bufferline = pcall(require, "bufferline")
if not ok then vim.notify("Load bufferline Failed", "warn")
	return
end

local icons = require("utils.ui.icons")

vim.opt.termguicolors = true
bufferline.setup({
	options = {
		numbers = "ordinal",
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		offsets = {
			{
				-- 左侧让出nvim-tree的位置
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		-- 使用 nvim 内置 lsp
		diagnostics = "nvim_lsp",
		separator_style = "thin",
		-- 显示 LSP 报错图标
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local c = ""
			if diagnostics_dict.error then
				c = c .. icons.diagnostics.Error .. diagnostics_dict.error
			elseif diagnostics_dict.warning then
				c = c .. icons.diagnostics.Warn .. diagnostics_dict.warning
			elseif diagnostics_dict.info then
				c = c .. icons.diagnostics.Info .. diagnostics_dict.info
			elseif diagnostics_dict.hint then
				c = c .. icons.diagnostics.Hint .. diagnostics_dict.hint
			end
			return c
		end,
	},
})

local map = require("utils.mapping")

map.set("n", "<leader>b1", "<CMD>BufferLineGoToBuffer 1<CR>", "Buffer 1")
map.set("n", "<leader>b2", "<CMD>BufferLineGoToBuffer 2<CR>", "Buffer 2")
map.set("n", "<leader>b3", "<CMD>BufferLineGoToBuffer 3<CR>", "Buffer 3")
map.set("n", "<leader>b4", "<CMD>BufferLineGoToBuffer 4<CR>", "Buffer 4")
map.set("n", "<leader>b5", "<CMD>BufferLineGoToBuffer 5<CR>", "Buffer 5")
map.set("n", "<leader>b6", "<CMD>BufferLineGoToBuffer 6<CR>", "Buffer 6")
map.set("n", "<leader>b7", "<CMD>BufferLineGoToBuffer 7<CR>", "Buffer 7")
map.set("n", "<leader>b8", "<CMD>BufferLineGoToBuffer 8<CR>", "Buffer 8")
map.set("n", "<leader>b9", "<CMD>BufferLineGoToBuffer 9<CR>", "Buffer 9")
map.set("n", "<leader>b[", "<CMD>BufferLineMovePrev<CR>", "Move Buffer Previous")
map.set("n", "<leader>b]", "<CMD>BufferLineMoveNext<CR>", "Move Buffer Next")

map.set("n", "<leader>bn", "<CMD>BufferLineCycleNext<CR>", "Next Buffer")
map.set("n", "<leader>bp", "<CMD>BufferLineCyclePrev<CR>", "Previous Buffer")
map.set("n", "<leader>bk", "<CMD>BufferLinePick<CR>", "Buffer Pick")
map.set("n", "<leader>bd", "<CMD>BDelete!<CR>", "Buffer Delete")
map.set("n", "<leader>bcp", "<CMD>BufferLinePickClose<CR>", "Pick Buffer")
map.set("n", "<leader>bcl", "<CMD>BufferLineCloseLeft<CR>", "Left Buffer")
map.set("n", "<leader>bcr", "<CMD>BufferLineCloseRight<CR>", "Right Buffer")
map.set("n", "<leader>bst", "<CMD>BufferSortByTabs<CR>", "Sort By Tabs")
map.set("n", "<leader>bsd", "<CMD>BufferSortByDirecory<CR>", "Sort By Direcory")
map.set("n", "<leader>bse", "<CMD>BufferLineSortByExtension<CR>", "Sort By Extension")
map.set("n", "<leader>bsr", "<CMD>BufferLineSortByRelativeDirectory<CR>", "Sort By RelativeDirectory")
