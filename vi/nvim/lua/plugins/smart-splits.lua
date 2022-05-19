-- =================
-- smart-splits.lua --- smart-split config file
-- Author: MuCheng
-- =================
--
local ok, split = pcall(require, "smart-splits")
if not ok then
	vim.notify("Load smart-splits Failed", "warn")
	return
end

split.setup({
	-- Ignored filetypes (only while resizing)
	ignored_filetypes = {
		"nofile",
		"quickfix",
		"prompt",
	},
	-- Ignored buffer types (only while resizing)
	ignored_buftypes = { "NvimTree" },
	-- when moving cursor between splits left or right,
	-- place the cursor on the same row of the *screen*
	-- regardless of line numbers. False by default.
	-- Can be overridden via function parameter, see Usage.
	move_cursor_same_row = false,
})

local keys = require("utils.keys")

-- keys.mapLua("<A-h>", "require('smart-splits').resize_left()")
-- keys.mapLua("<A-j>", "require('smart-splits').resize_down()")
-- keys.mapLua("<A-k>", "require('smart-splits').resize_up()")
-- keys.mapLua("<A-l>", "require('smart-splits').resize_right()")

-- moving between splits
keys.mapLua("<C-h>", "require('smart-splits').move_cursor_left()")
keys.mapLua("<C-j>", "require('smart-splits').move_cursor_down()")
keys.mapLua("<C-k>", "require('smart-splits').move_cursor_up()")
keys.mapLua("<C-l>", "require('smart-splits').move_cursor_right()")

-- TODO 开启resize mode时自动关闭focus
local wk = require("which-key")
wk.register({
    s = {
        name = "+Split",
	    r = { "<CMD>lua require('smart-splits').start_resize_mode()<CR>", "Resize Mode" },
    }
}, { prefix = "<leader>" })
