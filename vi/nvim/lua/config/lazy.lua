-- =================
-- lazy.lua
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

require("lazy").setup({
	spec = {
		-- add LichtVim and import its plugins and config
		{ "leisurelicht/LichtVim", import = "lichtvim.plugins", config = true },

    -- stylua: ignore
    -- load local config to develop
		-- { dir = "~/Code/neovim/LichtVim", import = "lichtvim.plugins", config = true, },

		{ import = "lichtvim.plugins.extras.lang" }, -- load language
		-- { import = "lichtvim.plugins.extras.tabnine.cmp" }, -- load tabnine to complete
		{ import = "lichtvim.plugins.extras.copilot.attach" }, -- load copilot to give suggestion
	},
	defaults = {
		lazy = false,
		version = false, -- always use the latest git commit
	},
	install = { missing = true, colorscheme = { "tokyonight", "vscode" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {},
		},
	},
})
