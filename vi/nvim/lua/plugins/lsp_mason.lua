-- =================
-- mason.lua 
-- Note: mason and extensions config file
-- Author: MuCheng
-- Link: https://github.com/williamboman/mason.nvim
-- Link: https://github.com/williamboman/mason-lspconfig.nvim
-- =================
--
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    vim.notify("Load mason Failed", "warn")
    return
end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
    vim.notify("Load mason-lspconfig Failed", "warn")
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        }
    }
})

-- 语言安装列表
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
mason_lsp.setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "pyright",
        "jedi_language_server",
        "jsonls",
        "bashls",
        "clangd",
        "sqlls",
        "dockerls",
        "cmake",
        "vimls",
        "prosemd_lsp",
    }
})
