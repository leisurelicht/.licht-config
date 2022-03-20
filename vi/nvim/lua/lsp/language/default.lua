-- =================
-- default.lua --- defalult language lsp config file
-- Author: MuCheng
-- =================
--
return {
  flags = {
    debounce_text_changes = 150,
  },

  on_attach = function(client, bufnr)
    -- 关闭lsp 的自动格式化
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require('lsp.keybindings').on_attach(client, bufnr)

    -- 保存时使用lsp的自动格式化
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end,
}
