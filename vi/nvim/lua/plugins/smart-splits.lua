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

local map = require("utils.mapping")
map.set("n", "<leader>sr", function() require("smart-splits").start_resize_mode() end, "Resize Mode")

-- moving between splits
map.set("n", "<C-h>", "require('smart-splits').move_cursor_left()")
map.set("n", "<C-j>", "require('smart-splits').move_cursor_down()")
map.set("n", "<C-k>", "require('smart-splits').move_cursor_up()")
map.set("n", "<C-l>", "require('smart-splits').move_cursor_right()")

-- keys.mapLua("<A-h>", "require('smart-splits').resize_left()")
-- keys.mapLua("<A-j>", "require('smart-splits').resize_down()")
-- keys.mapLua("<A-k>", "require('smart-splits').resize_up()")
-- keys.mapLua("<A-l>", "require('smart-splits').resize_right()")
