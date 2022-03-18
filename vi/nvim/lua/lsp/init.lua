-- ==============
-- init.lua --- lsp init file
-- Author: MuCheng
-- =================
--
local ok, _ = pcall(require, "lspconfig")
if not ok then
  vim.notify("Load nvim-lspconfig Failed", "warn")
  return
end
local install_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not install_ok then
  vim.notify("Load nvim-lsp-installer Failed", "warn")
  return
end

local language_ok, language = pcall(require, "lsp.language")
if not language_ok then
  vim.notify("Load lsp language Failed", "warn")
return
end

local keybindings = require("lsp.keybindings")


lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

language.autoInstall(lsp_installer)

lsp_installer.on_server_ready(function(server)
  local opts = language[server.name]
  opts.on_attach = keybindings.on_attach
  opts.flags = {
    debounce_text_changes = 150,
  }
  server:setup(opts)
end)

-- require('lsp.nvim-cmp')
