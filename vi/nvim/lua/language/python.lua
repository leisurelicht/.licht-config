-- =================
-- python.lua --- python lsp config file
-- Author: MuCheng
-- =================
--
vim.cmd([[
augroup file_set
  autocmd FileType python
          \ setlocal fileformat=unix |
          \ setlocal tabstop=4 |
          \ setlocal softtabstop=4 |
          \ setlocal shiftwidth=4 |
          \ setlocal colorcolumn=79 |
  autocmd FileType htmldjango
          \ setlocal fileformat=unix |
          \ setlocal tabstop=2 |
          \ setlocal softtabstop=2 |
          \ setlocal shiftwidth=2 |
augroup end
]])

return {
  flags = {debounce_text_changes = 150},

  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require('lsp.keybindings').on_attach(client, bufnr)

    -- 保存时使用lsp的自动格式化
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
}

