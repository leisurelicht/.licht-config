-- =================
-- python.lua --- python lsp config file
-- Author: MuCheng
-- =================
--
return {
  flags = {
    debounce_text_changes = 150,
  },

  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require('lsp.keybindings').on_attach(client, bufnr)
  end,
}

