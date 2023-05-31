-- =================
-- lazy.lua
-- Note: plugins manage lazy config
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

require("lazy").setup({
  spec = {
    { "leisurelicht/LichtVim", import = "lichtvim.plugins" },

    { import = "lichtvim.plugins.extras.lang.go" },
    { import = "lichtvim.plugins.extras.lang.bash" },
  },
  defaults = { lazy = false, version = false },
  ui = { border = "rounded", title = " Lazy Plugins Manager " },
  install = { missing = true, colorscheme = { "tokyonight", "vscode" } },
  checker = { enabled = true },
})
