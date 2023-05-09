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
		{ "leisurelicht/LichtVim", import = "lichtvim.plugins" },
		-- { dir = "~/Code/neovim/LichtVim", import = "lichtvim.plugins" }, -- load local config to develop
		{ import = "lichtvim.plugins.extras.lang" }, -- load language
		{ import = "lichtvim.plugins.extras.tabnine.cmp" }, -- load tabnine to complete
		{ import = "lichtvim.plugins.extras.copilot.attach" }, -- load copilot to give suggestion
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
	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {},
		},
	},
})
