-- ==============
-- language.lua --- 支持的语言列表
-- Author: MuCheng
-- =================
--
-- 语言安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
--
local servers = {
  sumneko_lua = require('lsp.lua'),
  gopls = require('lsp.go')

}

-- 自动安装 language server
-- 可以使用 :LspInstallInfo 命令查看安装状态
function servers.autoInstall(lsp_installer)
  for name, _ in pairs(servers) do
    local server_ok, server = lsp_installer.get_server(name)
    if server_ok then
      if not server:is_installed() then
        vim.notify("Installing " .. name, "info")
        server:install()
      end
    end
  end
end

return servers
