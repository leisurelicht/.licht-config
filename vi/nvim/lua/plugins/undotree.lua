-- =================
-- undotree.lua --- 历史保存
-- Author: MuCheng
-- =================
--
local sys = require("utils.sys")
local path = require("utils.path")

if sys.IsMacOS() and vim.fn.has("presistent_undo") then
    local undotree_dir = vim.fn.expand(path.join(vim.fn.stdpath("cache"), "undodir"))

    -- style: default 1, optional: 1 2 3 4
    vim.g.undotree_WindowLayout = 4

    -- auto focus default 0
    vim.g.undotree_SetFocusWhenToggle = 1


    if vim.fn.isdirectory(undotree_dir) then
        vim.fn.mkdir(undotree_dir, "p", 0777)
    end

    vim.o.undodir = undotree_dir

    vim.o.undofile = true
end

local map = require("utils.mapping")

map.set("n", "<F6>", "<CMD>UndotreeToggle<CR>", "UndoTree")
map.set("n", "<leader>uu", "<CMD>UndotreeToggle<CR>", "UndoTree")
