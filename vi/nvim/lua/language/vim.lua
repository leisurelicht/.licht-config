-- =================
-- vim.lua --- vim config file
-- Author: MuCheng
-- =================
--
M = {}

M.lsp = {
  flags = {debounce_text_changes = 150},
  on_attach = function(client, bufnr)
    -- 关闭lsp 的自动格式化
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require("plugins.lsp.keybindings").register(client, bufnr)
  end
}

return M
