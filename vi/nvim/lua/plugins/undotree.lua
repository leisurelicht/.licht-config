-- =================
-- undotree.lua --- 历史保存
-- Author: MuCheng
-- =================
--
local path = require("utils.path")

local undotree_dir = path.join(vim.fn.stdpath("cache"), "undodir")

if vim.fn.has("presistent_undo") then
	-- style: default 1, optional: 1 2 3 4
	vim.g.undotree_WindowLayout = 4

	-- auto focus default 0
	vim.g.undotree_SetFocusWhenToggle = 1

	local target_path = vim.fn.expand(undotree_dir)

	if vim.fn.isdirectory(target_path) then
		vim.fn.mkdir(target_path, "p", 0700)
	end

	vim.o.undodir = target_path
	vim.o.undofile = true
end

local map = require("utils.mapping")

map.set("n", "<F6>", "<CMD>UndotreeToggle<CR>", "UndoTree")

