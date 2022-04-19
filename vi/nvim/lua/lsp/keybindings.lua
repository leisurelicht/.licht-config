-- =================
-- keybindings.lua --- lsp 快捷键
-- Author: MuCheng
-- =================
--
local wk = require("which-key")

wk.register({
  l = {
    name="+LSP",
    I = {"<CMD>LspInstallInfo<CR>", "Install Info"}
  },
}, {prefix = "<leader>"})

local maps = {}

maps.register = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local ok, _ = pcall(require, "telescope")
  if ok then
    wk.register({
      ["la"] = {"<CMD>Telescope lsp_code_actions<CR>", "Code Action"},
      ["le"] = {"<CMD>Telescope lsp_references<CR>", "References"},
      ["ld"] = {"<CMD>Telescope lsp_definitions<CR>", "Definition"},
      ["lt"] = {"<CMD>Telescope lsp_type_definitions<CR>", "Type Definition"},
      ["li"] = {"<CMD>Telescope lsp_implementations<CR>", "Implementation"},
      ["lg"] = {"<CMD>Telescope diagnostics<CR>", "Diagnostic"},
      ["ls"] = {
        name = "+Symbols",
        d = {"<CMD>Telescope lsp_document_symbols<CR>", "Document"},
        w = {"<CMD>Telescope lsp_workspace_symbols<CR>", "WorkSpace"},
        y = {"<CMD>Telescope lsp_dynamic_workspace_symbols", "Dynamically"},
      }
    }, {prefix="<leader>", buffer=bufnr})
  else
    wk.register({
      ["la"] = {"<CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action"},
      ["le"] = {"<CMD>lua vim.lsp.buf.references()<CR>", "References"},
      ["ld"] = {"<CMD>lua vim.lsp.buf.definition()<CR>", "Definition"},
      ["lt"] = {"<CMD>lua vim.lsp.buf.type_definition()<CR>", "Type Definition"},
      ["li"] = {"<CMD>lua vim.lsp.buf.implementation()<CR>", "Implementation"},
    }, {prefix="<leader>", buffer=bufnr})
  end

  wk.register({
    ["lo"] = {"<CMD>lua vim.lsp.buf.open_float()<CR>", "Diagnostic In Float"},
    ["ll"] = {"<CMD>lua vim.lsp.buf.setloclist()<CR>", "Diagnostic In Quickfix"},
    ["lD"] = {"<CMD>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
    ["lK"] = {"<CMD>lua vim.lsp.buf.hover()<CR>", "Hover"},
    ["lk"] = {"<CMD>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
    ["lr"] = {"<CMD>lua vim.lsp.buf.rename()<CR>", "Rename"},
    ["lf"] = {"<CMD>lua vim.lsp.buf.formatting()<CR>", "Formatting"},
    ["lw"] = {
      name = "+WorkSpace",
      a = {"<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder"},
      r = {"<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder"},
      l = {"<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders"},
    },
  }, {prefix="<leader>", buffer=bufnr})

  wk.register({
      ["]d"] = {"<CMD>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic Info"},
      ["[d"] = {"<CMD>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic Info"},
  }, {buffer=bufnr})
end

return maps
