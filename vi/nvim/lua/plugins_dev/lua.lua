M = {}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

M.lsp = {
  cmd = {"lua-language-server", "--locale=zh-CN"},
  settings = {
    Lua = {
      runtime = {version = "LuaJIT", path = runtime_path},
      diagnostics = {globals = {"vim"}},
      workspace = {library = vim.api.nvim_get_runtime_file("", true)},
      telemetry = {enable = false}
    }
  },
  flags = {debounce_text_changes = 150},
  on_attach = function(client, bufnr)
    -- 关闭lsp 的自动格式化
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
}

return M
