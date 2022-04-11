local keys = require("utils.keys")

local maps = {}

maps.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local ok, _ = pcall(require, "telescope")
  if not ok then
    keys.mapBufLua(bufnr, '<leader>la', 'vim.lsp.buf.code_action()')
    keys.mapBufLua(bufnr, '<leader>le', 'vim.lsp.buf.references()')
    keys.mapBufLua(bufnr, '<leader>ld', 'vim.lsp.buf.definition()')
    keys.mapBufLua(bufnr, '<leader>lt', 'vim.lsp.buf.type_definition()')
    keys.mapBufLua(bufnr, '<leader>li', 'vim.lsp.buf.implementation()')
  end

  keys.mapBufLua(bufnr, '<leader>lD', 'vim.lsp.buf.declaration()')
  keys.mapBufLua(bufnr, '<leader>lK', 'vim.lsp.buf.hover()')
  keys.mapBufLua(bufnr, '<leader>lk', 'vim.lsp.buf.signature_help()')
  keys.mapBufLua(bufnr, '<leader>lr', 'vim.lsp.buf.rename()')
  keys.mapBufLua(bufnr, '<leader>lf', 'vim.lsp.buf.formatting()')
  keys.mapBufLua(bufnr, '<leader>lwa', 'vim.lsp.buf.add_workspace_folder()')
  keys.mapBufLua(bufnr, '<leader>lwr', 'vim.lsp.buf.remove_workspace_folder()')
  keys.mapBufLua(bufnr, '<leader>lwl',
                 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
  keys.mapBufLua(bufnr, ']d', 'vim.diagnostic.goto_next()')
  keys.mapBufLua(bufnr, '[d', 'vim.diagnostic.goto_prev()')
end

local nmap = {
  l = {
    name = "+LSP",
    a = {"<CMD>Telescope lsp_code_actions<CR>", "Code Action"},
    e = {"<CMD>Telescope lsp_references<CR>", "References"},
    d = {"<CMD>Telescope lsp_definitions<CR>", "Definition"},
    t = {"<CMD>Telescope lsp_type_definitions<CR>", "Type Definition"},
    i = {"<CMD>Telescope lsp_implementations<CR>", "Implementation"},
    s = {
      name = "+Symbols",
      d = {"<CMD>Telescope lsp_document_symbols", "Document"},
      w = {"<CMD>Telescope lsp_workspace_symbols", "WorkSpace"},
      y = {"<CMD>Telescope lsp_dynamic_workspace_symbols", "Dynamically"}
    },
    g = {"<CMD>Telescope diagnostics<CR>", "Diagnostic"},

    o = {"<CMD>lua vim.diagnostic.open_float()<CR>", "Diagnostic In Float"},
    l = {"<CMD>lua vim.diagnostic.setloclist()<CR>", "Diagnostic In Quickfix"},
    -- n = {"<CMD>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic Info"},
    -- p = {"<CMD>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic Info"},
    D = {"Declaration"},
    K = {"Hover"},
    k = {"Signature Help"},
    r = {"Rename"},
    f = {"Formatting"},
    w = {
      name = "+WorkSpace",
      a = {"Add Workspace Folder"},
      r = {"Remove Workspace Folder"},
      l = {"List Workspace Folders"}
    },
    I = {"<CMD>LspInstallInfo<CR>", "Install Info"}
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)

return maps
