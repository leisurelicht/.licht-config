-- =================
-- lua.lua --- lua config file
-- Author: MuCheng
-- =================
--

M = {}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

M.lsp = {
  cmd = {"lua-language-server", "--locale=zh-CN"},
  filetypes = {"lua"},
  log_level = 2,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  settings = {
    Lua = {
      runtime = {version = "LuaJIT", path = runtime_path},
      diagnostics = {globals = {"vim"}},
      workspace = {library = vim.api.nvim_get_runtime_file("", true)},
      telemetry = {enable = false}
    }
  },
  on_attach = function(client, bufnr)
    -- 关闭lsp 的自动格式化
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require("plugins.lsp.keybindings").register(client, bufnr)
  end
}

return M
