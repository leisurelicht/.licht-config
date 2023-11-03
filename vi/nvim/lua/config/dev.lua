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
  dev = { path = "~/Code/neovim" },
  defaults = { lazy = false, version = false },
  ui = { border = "rounded", title = "Develop Lazy Plugins Manager " },
  checker = { enabled = false }, -- automatically check for plugin updates
  spec = {
    -- add LichtVim and import its plugins and config
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = { colorscheme = "catppuccin-frappe" },
      dev = true,
      config = true,
    },
  },
})
