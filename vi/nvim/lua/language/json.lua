-- =================
-- json.lua --- json lsp config file
-- Author: MuCheng
-- =================
--
M = {}
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.lsp = {
  capabilities = capabilities,
  flags = {debounce_text_changes = 150},
  on_attach = function(client, bufnr)
    -- 关闭lsp 的自动格式化
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require("plugins.lsp.keybindings").register(client, bufnr)

    -- 保存时使用lsp的自动格式化
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
}

return M
