-- ==============
-- lsp.lua --- lsp config file
-- Author: MuCheng
-- =================
--
local ok, _ = pcall(require, "lspconfig")
if not ok then
    vim.notify("Load nvim-lspconfig Failed", "warn")
    return
end

local install_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not install_ok then
    vim.notify("Load nvim-lsp-installer Failed", "warn")
    return
end

lsp_installer.settings(
    {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}
)

---@diagnostic disable-next-line: missing-parameter
lsp_installer.setup()

vim.diagnostic.config(
    {
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = { source = "always" },
    virtual_text = { prefix = "●", source = "always" }
}
)

local icons = require("utils.icons")

for tpe, icon in pairs(icons.diagnostics) do
    local hl = "DiagnosticSign" .. tpe
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- 语言安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
local servers = {
    "sumneko_lua",
    "gopls",
    "pyright",
    "jedi_language_server",
    "zk",
    "jsonls",
    "bashls",
    "clangd",
    "sqlls",
    "dockerls",
    "cmake",
    "vimls"
}

local function lsp_hover(_, result, ctx, config)
    local bufnr, winner = vim.lsp.handlers.hover(_, result, ctx, config)
    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

local function lsp_signature_help(_, result, ctx, config)
    local bufnr, winner = vim.lsp.handlers.signature_help(_, result, ctx, config)
    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

local lsp_handlers = {
    ["textDocument/hover"] = vim.lsp.with(
        lsp_hover,
        {
        border = "rounded",
        filetype = "lsp-hover"
    }
    ),
    ["textDocument/signatureHelp"] = vim.lsp.with(
        lsp_signature_help,
        {
        border = "rounded",
        filetype = "lsp-signature-help"
    }
    )
}

for _, server_name in ipairs(servers) do
    local server_ok, server = lsp_installer.get_server(server_name)
    if not server_ok then
        vim.notify("LSP Server : " .. server_name .. " Can not Get", "Error")
        goto continue
    end

    ---@diagnostic disable-next-line: undefined-field
    if not server:is_installed() then
        vim.notify("Installing LSP Server : " .. server_name, "info")
        ---@diagnostic disable-next-line: undefined-field
        server:install()
    else
        local server_file = "plugins.lsp.config." .. server_name
        local opts_ok, opts = pcall(require, server_file)
        if not opts_ok then
            vim.notify("Get LSP Config : " .. server_file .. " Failed.", "Warn")
            goto continue
        end

        opts.options.on_attach = function(client, bufnr)
            opts.hooks.attach(client, bufnr)
            require("plugins.lsp.keybindings").register(client, bufnr)
        end
        opts.options.flags = { debounce_text_changes = 150 }
        opts.options.capabilities = require("plugins.lsp.nvim-cmp").capabilities
        opts.options.handlers = vim.tbl_deep_extend("force", lsp_handlers, opts.options.handlers or {})
        require("lspconfig")[server_name].setup(opts.options)
    end
    ::continue::
end
