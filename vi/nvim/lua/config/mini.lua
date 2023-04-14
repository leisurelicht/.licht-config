-- =================
-- mini.lua
-- Note: plugins manage lazy config
-- Link: https://github.com/folke/lazy.nvim
-- =================
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
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
				lspconfig.gopls.setup({})
			end,
		},
		{
			"nvimdev/lspsaga.nvim",
			dependencies = {
				"neovim/nvim-lspconfig",
				{ "nvim-tree/nvim-web-devicons" },
				--Please make sure you install markdown and markdown_inline parser
				{ "nvim-treesitter/nvim-treesitter" },
			},
			opts = {
				code_action = {
					num_shortcut = true,
					show_server_name = true,
					extend_gitsigns = false,
					keys = {
						quit = "q",
						exec = "<CR>",
					},
				},
				lightbulb = {
					enable = true,
					enable_in_insert = false,
					sign = true,
					sign_priority = 40,
					virtual_text = false,
				},
				ui = {
					border = "rounded",
				},
			},
			config = function(_, opts)
				require("lspsaga").setup(opts)
			end,
		},
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
