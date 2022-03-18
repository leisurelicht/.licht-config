
local keys = require("utils.keys")

local maps = {}

keys.mapLua('<leader>lo', 'vim.diagnostic.open_float()')
keys.mapLua('<leader>ll', 'vim.diagnostic.setloclist()')
keys.mapLua('<leader>lp', 'vim.diagnostic.goto_prev()')
keys.mapLua('<leader>ln', 'vim.diagnostic.goto_next()')

maps.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  keys.mapBufLua(bufnr, '<leader>lD', 'vim.lsp.buf.declaration()')
  keys.mapBufLua(bufnr, '<leader>ld', 'vim.lsp.buf.definition()')
  keys.mapBufLua(bufnr, '<leader>lK', 'vim.lsp.buf.hover()')
  keys.mapBufLua(bufnr, '<leader>li', 'vim.lsp.buf.implementation()')
  keys.mapBufLua(bufnr, '<leader>lk', 'vim.lsp.buf.signature_help()')
  keys.mapBufLua(bufnr, '<leader>lr', 'vim.lsp.buf.rename()')
  keys.mapBufLua(bufnr, '<leader>la', 'vim.lsp.buf.code_action()')
  keys.mapBufLua(bufnr, '<leader>lt', 'vim.lsp.buf.type_definition()')
  keys.mapBufLua(bufnr, '<leader>le', 'vim.lsp.buf.references()')
  keys.mapBufLua(bufnr, '<leader>lf', 'vim.lsp.buf.formatting()')
  keys.mapBufLua(bufnr, '<leader>lwa', 'vim.lsp.buf.add_workspace_folder()')
  keys.mapBufLua(bufnr, '<leader>lwr', 'vim.lsp.buf.remove_workspace_folder()')
  keys.mapBufLua(bufnr, '<leader>lwl', 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
end

local nmap = {
  l = {
    name = "+LSP",
    o = {"Diagnostic In Float"},
    l = {"Diagnostic In Quickfix"},
    n = {"Next Diagnostic Info"},
    p = {"Previous Diagnostic Info"},
    D = {"Declaration"},
    d = {"Definition"},
    K = {"Hover"},
    i = {"Implementation"},
    k = {"Signature Help"},
    r = {"Rename"},
    a = {"Code Action"},
    t = {"Type Definition"},
    e = {"References"},
    f = {"Formatting"},
    w = {
      name = "+WorkSpace",
      a = {"Add Workspace Folder"},
      r = {"Remove Workspace Folder"},
      l = {"List Workspace Folders"},
    }
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)

return maps
