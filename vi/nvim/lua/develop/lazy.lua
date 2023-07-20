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
    { "LazyVim/LazyVim", import = "lazyvim.plugins", dev = true, config = true },
  },
  dev = {
    path = "~/Code/neovim",
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  ui = {
    border = "rounded",
    title = "Develop Lazy Plugins Manager ",
  },
  install = { missing = true, colorscheme = { "tokyonight", "vscode" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {},
    },
  },
})
