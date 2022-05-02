-- =================
-- python.lua --- python lsp config file
-- Author: MuCheng
-- =================
--
M = {}

M.lsp = {
  flags = {debounce_text_changes = 150},
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require("plugins.lsp.keybindings").register(client, bufnr)

    -- 保存时使用lsp的自动格式化
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
}

M.dap = {
  adapters = {
    type = "executable",
    command = "python3",
    args = {"-m", "debugpy.adapter"}
  },
  configurations = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        return "/opt/homebrew/bin/python3"
      end
    }
  }
}

return M
