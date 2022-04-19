-- =================
-- lua.lua --- lua config file
-- Author: MuCheng
-- =================
--
vim.cmd([[
augroup file_set
  autocmd FileType lua
          \ setlocal fileformat=unix |
          \ setlocal tabstop=2 |
          \ setlocal softtabstop=2 |
          \ setlocal shiftwidth=2 |
augroup end
]])

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

return {
  settings = {
    Lua = {
      runtime = {version = 'LuaJIT', path = runtime_path},
      diagnostics = {globals = {'vim'}},
      workspace = {library = vim.api.nvim_get_runtime_file('', true)},
      telemetry = {enable = false}
    }
  },

  flags = {debounce_text_changes = 150},

  on_attach = function(client, bufnr)
    -- 关闭lsp 的自动格式化
    -- client.resolved_capabilities.document_formatting = false
    -- client.resolved_capabilities.document_range_formatting = false

    -- print("client:"..vim.inspect(client))
    -- print("bufnr:"..bufnr)

    require('lsp.keybindings').register(client, bufnr)

    -- 保存时使用lsp的自动格式化
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end

}
