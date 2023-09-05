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
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  ui = { border = "rounded", title = " Lazy Plugins Manager " },
  install = { missing = true, colorscheme = { "tokyonight", "vscode" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = { "matchparen", "netrwPlugin", "tohtml", "tutor" },
    },
  },
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = { colorscheme = "catppuccin-frappe" },
    },
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "plugins" },

    { "wakatime/vim-wakatime", enabled = true },
  },
})
