-- =================
-- nvim-treesitter.lua 
-- Note: nvim-treesitter config file
-- Author: MuCheng
-- Link: https://github.com/nvim-treesitter/nvim-treesitter
-- =================
--
local ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not ok then
	vim.notify("Load nvim-treesitter configs Failed", "warn")
	return
end

treesitter_config.setup({
	ensure_installed = {
		"vim",

		"bash",
		"c",
		"lua",
		"go",
		"gomod",
        "gowork",
		"html",
		"python",
		"php",
		"sql",

		"json",
		"yaml",
		"markdown",
        "markdown_inline",
		"http",
		"dockerfile",

		"make",
		"cmake",
		"comment",
		"gitignore",
		"toml",
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
	indent = {
		enable = true,
		disable = { "python", "go" },
	},
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
	endwise = {
		enable = true,
	},
})

--[[ vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, { ]]
--[[   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}), ]]
--[[   callback = function() ]]
--[[     vim.opt.foldmethod     = 'expr' ]]
--[[     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()' ]]
--[[     vim.opt.foldlevelstart = 99 ]]
--[[   end ]]
--[[ }) ]]

local map = require("utils.mapping")
map.set("n", "<leader>Tu", "<CMD>TSUpdate all<CR>", "Update All")
map.set("n", "<leader>Ts", "<CMD>TSModuleInfo<CR>", "Module Info")
