-- =================
-- keybindings.lua --- lsp 快捷键
-- Author: MuCheng
-- =================
--
local wk = require("which-key")

wk.register(
  {
    l = {
      name = "+LSP",
      I = {"<CMD>LspInstallInfo<CR>", "Install Info"}
    }
  },
  {prefix = "<leader>"}
)

local maps = {}

maps.register = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local ok, _ = pcall(require, "telescope")
  if ok then
    wk.register(
      {
        ["le"] = {"<CMD>Telescope lsp_references theme=dropdown<CR>", "References"},
        ["ld"] = {"<CMD>Telescope lsp_definitions theme=dropdown<CR>", "Definition"},
        ["lt"] = {"<CMD>Telescope lsp_type_definitions theme=dropdown<CR>", "Type Definition"},
        ["li"] = {"<CMD>Telescope lsp_implementations theme=dropdown<CR>", "Implementation"},
        ["lg"] = {"<CMD>Telescope diagnostics theme=dropdown<CR>", "Diagnostic"},
        ["ls"] = {
          name = "+Symbols",
          d = {"<CMD>Telescope lsp_document_symbols theme=dropdown<CR>", "Document"},
          w = {"<CMD>Telescope lsp_workspace_symbols theme=dropdown<CR>", "WorkSpace"},
          y = {"<CMD>Telescope lsp_dynamic_workspace_symbols theme=dropdown<CR>", "Dynamically"}
        }
      },
      {prefix = "<leader>", buffer = bufnr}
    )
  else
    wk.register(
      {
        ["le"] = {"<CMD>lua vim.lsp.buf.references()<CR>", "References"},
        ["ld"] = {"<CMD>lua vim.lsp.buf.definition()<CR>", "Definition"},
        ["lt"] = {"<CMD>lua vim.lsp.buf.type_definition()<CR>", "Type Definition"},
        ["li"] = {"<CMD>lua vim.lsp.buf.implementation()<CR>", "Implementation"}
      },
      {prefix = "<leader>", buffer = bufnr}
    )
  end

  wk.register(
    {
      ["lr"] = {"<CMD>Lspsaga rename<CR>", "Rename"},
      ["la"] = {"<CMD>Lspsaga code_action<CR>", "Code Action"},
      ["lh"] = {"<CMD>Lspsaga hover_doc<CR>", "Hover"},
      ["lf"] = {"<CMD>Lspsaga lsp_finder<CR>", "Finder"},
      ["lD"] = {"<CMD>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
      ["lH"] = {"<CMD>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
      ["lm"] = {"<CMD>lua vim.lsp.buf.formatting()<CR>", "Formatting"},
      ["lw"] = {
        name = "+WorkSpace",
        a = {"<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder"},
        r = {"<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder"},
        l = {"<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders"}
      },
      ["ll"] = {"<CMD>Lspsaga show_line_diagnostics<CR>", "Line Diagnostic"},
      ["lj"] = {"<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic"},
      ["lk"] = {"<CMD>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic"}
    },
    {prefix = "<leader>", buffer = bufnr}
  )

  wk.register(
    {
      ["]d"] = {"<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic Info"},
      ["[d"] = {"<CMD>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic Info"},
      ["<C-b>"] = {"<CMD>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<CR>", "Scroll Up"},
      ["<C-f>"] = {"<CMD>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-u>')<CR>", "Scroll Down"}
    },
    {buffer = bufnr}
  )
end

return maps
