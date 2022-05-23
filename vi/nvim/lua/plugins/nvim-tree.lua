-- =================
-- nvim-tree.lua --- nvim-tree config file
-- Author: MuCheng
-- =================
--
local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	vim.notify("Load nvim-tree Failed", "warn")
	return
end

local config_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_ok then
	vim.notify("Load nvim-tree Config Failed", "warn")
	return
end

vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_respect_buf_cwd = 1

local tree_cb = nvim_tree_config.nvim_tree_callback

local function print_node_path(node)
	print(node.absolute_path)
end

nvim_tree.setup({
	open_on_setup = true,
	ignore_ft_on_setup = {},
	open_on_tab = true,
	system_open = { cmd = nil, args = {} },
	view = {
		mappings = {
			list = {
				{ key = "p", action = "print_path", action_cb = print_node_path },
				{ key = "s", cb = tree_cb("vsplit") },
				{ key = "o", cb = tree_cb("split") },
				{ key = "<C-o>", cb = tree_cb("system_open") },
			},
		},
		number = true,
	},
    update_cwd =true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    }
})


local keys = require("utils.keys")
keys.mapCmd("<F4>", "NvimTreeFindFileToggle")

local wk = require("which-key")
wk.register({
	F = {
		name = "+FileTree",
		["3"] = { "<CMD>NvimTreeResize 30<CR>", "Resize To 30" },
		["4"] = { "<CMD>NvimTreeResize 40<CR>", "Resize To 40" },
		["5"] = { "<CMD>NvimTreeResize 50<CR>", "Resize To 50" },
		["6"] = { "<CMD>NvimTreeResize 60<CR>", "Resize To 60" },
		t = { "<CMD>NvimTreeToggle<CR>", "Toggle" },
		f = { "<CMD>NvimTreeFocus<CR>", "Focus" },
		o = { "<CMD>NvimTreeOpen<CR>", "Open" },
		c = { "<CMD>NvimTreeClose<CR>", "Close" },
		n = { "<CMD>NvimTreeFindFileToggle<CR>", "Find File Toggle" },
		j = { "<CMD>NvimTreeFindFile<CR>", "Find File" },
	},
}, { prefix = "<leader>" })
