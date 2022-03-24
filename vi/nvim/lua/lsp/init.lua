-- ==============
-- init.lua --- lsp init file
-- Author: MuCheng
-- =================
--
-- 为了 which-key 能正常显示 LSP 相关快捷键
require('lsp.keybindings')

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

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

-- 语言安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
local servers = {
  sumneko_lua = 'lua',
  gopls = 'go',
  golangci_lint_ls = 'go',
  pyright = 'python',
  jedi_language_server = 'python',
  zk = 'markdown',
  jsonls = 'json',
  bashls = 'bash',
  clangd = 'default',
  -- sqlls = 'default',
  dockerls = 'default',
  cmake = 'default'
}

-- 自动安装 language server
-- 可以使用 :LspInstallInfo 命令查看安装状态
local function autoInstall(installer)
  for name, _ in pairs(servers) do
    local server_ok, server = installer.get_server(name)
    if server_ok then
      if not server:is_installed() then
        vim.notify("Installing " .. name, "info")
        server:install()
      end
    end
  end
end

autoInstall(lsp_installer)

lsp_installer.on_server_ready(function(server)
  local server_file = servers[server.name]

  if server_file == nil then return end

  server_file = "language." .. server_file

  local opts_ok, opts = pcall(require, server_file)
  if not opts_ok then
    vim.notify("Get Language Config : " .. server_file .. " Failed.")
    return
  end

  if opts == nil then return end

  if opts.capabilities == nil then opts.capabilities = require('lsp.nvim-cmp') end

  server:setup(opts)
end)
