-- ==============
-- lsp.lua --- lsp config file
-- Author: MuCheng
-- =================
--
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    vim.notify("Load nvim-lspconfig Failed", "warn")
    return
end

local install_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not install_ok then
    vim.notify("Load nvim-lsp-installer Failed", "warn")
    return
end

local api = require("utils.api")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "",
            server_pending = "",
            server_uninstalled = "ﮊ",
        }
    }
})

lsp_installer.setup({})

vim.diagnostic.config({
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = { source = "always" },
    virtual_text = { prefix = "●", source = "always" }
})

-- 为 lsp hover 添加文件类型
local function lsp_hover(_, result, ctx, config)
    -- Add file type for LSP hover
    local bufnr, winner = vim.lsp.handlers.hover(_, result, ctx, config)
    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

-- 为 lsp 签名帮助添加文件类型
local function lsp_signature_help(_, result, ctx, config)
    -- Add file type for LSP signature help
    local bufnr, winner = vim.lsp.handlers.signature_help(_, result, ctx, config)
    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

-- 设置浮动样式
local lsp_handlers = {
    ["textDocument/hover"] = vim.lsp.with(lsp_hover, {
        border = "rounded",
        filetype = "lsp-hover",
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(lsp_signature_help, {
        border = "rounded",
        filetype = "lsp-signature-help",
    }),
}

-- 语言安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
local servers = {
    "sumneko_lua",
    "gopls",
    -- "golangci_lint_ls",
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
        local server_file = "config.lsp." .. server_name
        local opts_ok, opts = pcall(require, server_file)
        if not opts_ok then
            vim.notify("Get LSP Config : " .. server_file .. " Failed.", "Warn")
            goto continue
        end

        local settings = opts.settings
        local options = opts.options

        options.flags = { debounce_text_changes = 150 }

        options.on_attach = function(client, bufnr)
            if opts.attach ~= nil then
                opts.attach(client, bufnr)
            end

            require("config.lsp.keybindings").register(client, bufnr)

            if settings.document_formatting ~= nil then
                client.server_capabilities.document_formatting = settings.document_formatting
                client.server_capabilities.document_range_formatting = settings.document_formatting
            end

            if settings.formatting_on_save ~= nil and settings.formatting_on_save then
                api.autocmd({ "BufWritePre" }, {
                    pattern = { "<buffer>" },
                    command = "lua vim.lsp.buf.formatting{ async = true }",
                })
            end
        end

        if settings.document_diagnostics ~= nil and not settings.document_diagnostics then
            local handler = {
                ---@diagnostic disable-next-line: unused-vararg
                ["textDocument/publishDiagnostics"] = function(...) end
            }
            options.handlers = vim.tbl_deep_extend("force", handler, options.handlers or {})
        end
        options.handlers = vim.tbl_extend("force", lsp_handlers, options.handlers or {})

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        if cmp_nvim_lsp_ok then
            capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
        end
        options.capabilities = capabilities

        lspconfig[server_name].setup(options)
    end
    ::continue::
end
