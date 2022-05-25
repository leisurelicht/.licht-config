-- =================
-- git.lua --- git 插件配置
-- Author: MuCheng
-- =================
--
local map = require("utils.mapping")

local shortcut = require("utils.shortcut")

-- lazygit
map.set("n", "<leader>gl", function() shortcut._Lazygit() end, "Lazygit")

-- git-blame
-- 默认关闭 git blame
vim.g.gitblame_enabled = 0

map.set("n", "<leader>gt", "<CMD>GitBlameToggle<CR>", "Toggle Blame")
map.set("n", "<leader>ge", "<CMD>GitBlameEnable<CR>", "Enable Blame")
map.set("n", "<leader>gd", "<CMD>GitBlameDisable<CR>", "Disable Blame")
map.set("n", "<leader>gy", "<CMD>GitBlameCopySHA<CR>", "Copy Blame SHA")
map.set("n", "<leader>go", "<CMD>GitBlameOpenCommitURL<CR>", "Open Commit URL")

-- gitsigns
local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	vim.notify("Load gitsigns Failed", "warn")
	return
else
	gitsigns.setup({
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = "+",
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = "!",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = "-",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		on_attach = function(bufnr)
			map.set("n", "<leader>ga", "<CMD>Gitsigns stage_hunk<CR>", "Add Hunk", { buffer = bufnr })
			map.set("n", "<leader>gA", "<CMD>Gitsigns stage_buffer<CR>", "Add Buffer", { buffer = bufnr })
			map.set("n", "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk", { buffer = bufnr })
			map.set("n", "<leader>gR", "<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer", { buffer = bufnr })
			map.set("n", "<leader>gu", "<CMD>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk", { buffer = bufnr })
			map.set("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk", { buffer = bufnr })
			map.set("n", "<leader>gs", function()
				gitsigns.blame_line({ full = true })
			end, "Show Blame Line", { buffer = bufnr })
			map.set("n", "<leader>gc", "<CMD>>Gitsigns toggle_deleted<CR>", "Toggle Deleted", { buffer = bufnr })

			map.set("v", "<leader>ga", "<CMD>Gitsigns stage_hunk<CR>", "Add Hunk", { buffer = bufnr })
			map.set("v", "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk", { buffer = bufnr })

			map.set(
				"n",
				"g]",
				"&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'",
				"Next Git Hunk",
				{ buffer = bufnr, expr = true }
			)
			map.set(
				"n",
				"g[",
				"&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'",
				"Previous Git Hunk",
				{ buffer = bufnr, expr = true }
			)

			-- Text object
			map.set("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk", { buffer = bufnr })
			map.set("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk", { buffer = bufnr })
		end,
	})
end
