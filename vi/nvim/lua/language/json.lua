-- =================
-- json.lua --- json lsp config file
-- Author: MuCheng
-- =================
--
vim.cmd([[
augroup file_set
  autocmd FileType json
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end
]])

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  capabilities = capabilities,

  flags = {debounce_text_changes = 150},

  on_attach = function(client, bufnr)
    -- 关闭lsp 的自动格式化
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require('lsp.keybindings').register(client, bufnr)

    -- 保存时使用lsp的自动格式化
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
}
