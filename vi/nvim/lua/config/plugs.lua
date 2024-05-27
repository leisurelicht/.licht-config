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
  -- dev = { path = "~/Code/neovim" },
  defaults = { lazy = false, version = false },
  ui = { border = "rounded", title = " Lazy Plugins Manager " },
  install = { missing = true, colorscheme = { "tokyonight", "vscode" } },
  checker = { enabled = true, frequency = 604800 }, -- automatically check for plugin updates
  performance = {
    rtp = { disabled_plugins = { "matchparen", "netrwPlugin", "tohtml", "tutor" } },
  },
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "catppuccin-frappe",
        border = "rounded",
      },
    },

    { import = "plugins" },

  },
})
