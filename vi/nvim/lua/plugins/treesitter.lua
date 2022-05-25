-- =================
-- nvim-treesitter.lua --- nvim-treesitter config file
-- Author: MuCheng
-- =================
--
local ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not ok then
	vim.notify("Load nvim-treesitter Failed", "warn")
	return
end

treesitter_config.setup({
	ensure_installed = {
		"vim",
		"bash",
		"lua",
		"go",
		"make",
		"markdown",
		"json",
		"c",
		"gomod",
		"yaml",
		"dockerfile",
		"comment",
		"cmake",
		"http",
		"html",
		"python",
	},

	highlight = { enable = true, additional_vim_regex_highlighting = false },
	-- 范围选择
	incremental_selection = {
		enable = true,
		keymaps = {
			-- 初始化选择
			init_selection = "<leader>Tn",
			-- 增加
			node_incremental = "<leader>Tr",
			-- 减少
			node_decremental = "<leader>Tc",
			-- 块选择
			scope_incremental = "<leader>Tm",
		},
	},

	-- 关闭缩进，bug太多
	indent = { enable = false, disable = { "python" } },
	-- 彩虹括号
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},

	-- comment
	context_commentstring = { enable = true },
	-- match % g% [% ]% z%
	matchup = {
		enable = true,
	},
})

local map = require("utils.mapping")
map.set("n", "<leader>Tw", "<CMD>MatchupWhereAmI??<CR>", "Match Up")
map.set("n", "<leader>Tu", "<CMD>TSUpdate all<CR>", "Update All" )
map.set("n", "<leader>Ts", "<CMD>TSModuleInfo<CR>", "Module Info" )
