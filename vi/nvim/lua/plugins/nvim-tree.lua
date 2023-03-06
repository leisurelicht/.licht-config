-- =================
-- nvim-tree.lua --- nvim-tree config file
-- Author: MuCheng
-- =================
--
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	vim.notify("Load nvim-tree Failed", "warn")
	return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback
local tree_api = require("nvim-tree.api").tree

local function print_node_path(node)
	print(node.absolute_path)
end

local file = require("utils.file")

local function open_nvim_tree(data)
	local alpha = vim.bo[data.buf].ft == "alpha"

	if alpha then
		return
	end

	-- buffer is a real file
	local real_file = file.is_exist(data.file)

	-- buffer is a directory
	local directory = file.is_dir(data.file)

	if not real_file and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	tree_api.open()
end

nvim_tree.setup({
	open_on_tab = false,
	respect_buf_cwd = true,
	system_open = { cmd = nil, args = {} },
	view = {
		width = 30,
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
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

local api = require("utils.api")
api.autocmd({ "VimEnter", "BufRead" }, { callback = open_nvim_tree })

local map = require("utils.mapping")
map.set("n", "<F4>", "<CMD>NvimTreeFindFileToggle<CR>", "NvimTree Toggle")
map.set("n", "<leader>F3", "<CMD>NvimTreeResize 30<CR>", "Resize To 30")
map.set("n", "<leader>F4", "<CMD>NvimTreeResize 40<CR>", "Resize To 40")
map.set("n", "<leader>F5", "<CMD>NvimTreeResize 50<CR>", "Resize To 50")
map.set("n", "<leader>F6", "<CMD>NvimTreeResize 60<CR>", "Resize To 60")
map.set("n", "<leader>Ft", "<CMD>NvimTreeToggle<CR>", "Toggle")
map.set("n", "<leader>Ff", "<CMD>NvimTreeFocus<CR>", "Focus")
map.set("n", "<leader>Fo", "<CMD>NvimTreeOpen<CR>", "Open")
map.set("n", "<leader>Fc", "<CMD>NvimTreeClose<CR>", "Close")
map.set("n", "<leader>Fn", "<CMD>NvimTreeFindFileToggle<CR>", "Find File Toggle")
map.set("n", "<leader>Fj", "<CMD>NvimTreeFindFile<CR>", "Find File")
