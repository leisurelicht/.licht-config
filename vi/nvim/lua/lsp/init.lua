-- ==============
-- init.lua --- lsp init file
-- Author: MuCheng
-- =================
--
vim.notify("require lsp config", "info")
local lsp_installer = require('nvim-lsp-installer')

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
local servers = {
  sumneko_lua = require('lsp.lua'),
  -- gopls = require('lsp.go')
}

-- 自动安装 language server
-- 可以使用 :LspInstallInfo 命令查看安装状态
for name, _ in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  if ok then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = servers[server.name]
  if opts then
    opts.on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      require('core.keybindings').maplsp(buf_set_keymap)
    end
    opts.flags = {
      debounce_text_changes = 150,
    }
    server:setup(opts)
  end
end)

require('lsp.nvim-cmp')
