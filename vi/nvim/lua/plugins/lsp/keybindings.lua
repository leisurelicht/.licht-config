-- =================
-- keybindings.lua --- lsp 快捷键
-- Author: MuCheng
-- =================
--
local keys = require("utils.keys")
local wk = require("which-key")

wk.register(
    {
        l = {
            name = "+LSP",
            I = {"<CMD>LspInstallInfo<CR>", "Install Info"},
            r = {"<CMD>Lspsaga rename<CR>", "Rename"},
            a = {"<CMD>Lspsaga code_action<CR>", "Code Action"},
            h = {"<CMD>Lspsaga hover_doc<CR>", "Hover"},
            H = {"<CMD>Lspsaga signature_help<CR>", "Signature Help"},
            f = {"<CMD>Lspsaga lsp_finder<CR>", "Finder"},
            d = {"<CMD>Lspsaga preview_definition<CR>", "Preview Definition"},
            l = {"<CMD>Lspsaga show_line_diagnostics<CR>", "Line Diagnostic"},
            j = {"<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic"},
            k = {"<CMD>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic"}
        }
    },
    {prefix = "<leader>"}
)
wk.register(
    {
        l = {
            name = "+LSP",
            a = {"<CMD><C-U>Lspsaga range_code_action<CR>", "Code Action"}
        }
    },
    {mode = "v", prefix = "<leader>"}
)
wk.register(
    {
        ["]d"] = {"<CMD>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic Info"},
        ["[d"] = {"<CMD>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic Info"}
    }
)

keys.mapKey("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
keys.mapKey("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")

local M = {}

M.register = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    wk.register(
        {
            ["le"] = {"<CMD>Telescope lsp_references theme=dropdown<CR>", "References"},
            ["lD"] = {"<CMD>Telescope lsp_definitions theme=dropdown<CR>", "Definition"},
            ["lt"] = {"<CMD>Telescope lsp_type_definitions theme=dropdown<CR>", "Type Definition"},
            ["li"] = {"<CMD>Telescope lsp_implementations theme=dropdown<CR>", "Implementation"},
            ["lg"] = {"<CMD>Telescope diagnostics theme=dropdown<CR>", "Diagnostic"},
            ["ls"] = {
                name = "+Symbols",
                d = {"<CMD>Telescope lsp_document_symbols theme=dropdown<CR>", "Document"},
                w = {"<CMD>Telescope lsp_workspace_symbols theme=dropdown<CR>", "WorkSpace"},
                y = {"<CMD>Telescope lsp_dynamic_workspace_symbols theme=dropdown<CR>", "Dynamically"}
            },
            ["lm"] = {"<CMD>lua vim.lsp.buf.formatting()<CR>", "Formatting"},
            ["lw"] = {
                name = "+WorkSpace",
                a = {"<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder"},
                r = {"<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder"},
                l = {"<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders"}
            }
        },
        {prefix = "<leader>", buffer = bufnr}
    )
end

return M
