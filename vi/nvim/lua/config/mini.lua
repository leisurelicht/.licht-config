-- =================
-- mini.lua
-- Note: neovim mini config file
-- Link: https://github.com/folke/lazy.nvim
-- =================
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", nbsp = "␣", extends = "❯", precedes = "❮", eol = "<" } -- 字符转换

require("lazy").setup({
	spec = {
		{
			"neovim/nvim-lspconfig",
			config = function()
				lspconfig = require("lspconfig")
				lspconfig.lua_ls.setup({
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
							telemetry = { enable = false },
						},
					},
				})
				lspconfig.gopls.setup({})
			end,
		},
		{
			"nvimdev/lspsaga.nvim",
			event = "LspAttach",
			dependencies = {
				"neovim/nvim-lspconfig",
				"nvim-tree/nvim-web-devicons",
				"nvim-treesitter/nvim-treesitter",
			},
			config = function()
				require("lspsaga").setup()
			end,
		},
	},
	defaults = {
		lazy = false,
		version = false,
	},
})
