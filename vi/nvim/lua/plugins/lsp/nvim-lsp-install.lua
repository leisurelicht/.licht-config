-- ==============
-- lsp.lua --- lsp isntaller config file
-- Author: MuCheng
-- =================
--
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

-- 语言安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
local servers = {
  sumneko_lua = "lua",
  gopls = "go",
  -- golangci_lint_ls = "go",
  pyright = "python",
  -- -- pylsp = "python",
  -- jedi_language_server = "python",
  zk = "markdown",
  jsonls = "json",
  bashls = "bash",
  clangd = "default",
  sqlls = "default",
  dockerls = "default",
  cmake = "default",
  vimls = "default"
}

---@diagnostic disable-next-line: missing-parameter
lsp_installer.setup()

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

for server_name, server_file in pairs(servers) do
  local ok, server = lsp_installer.get_server(server_name)
  if not ok then
    goto continue
  end

  ---@diagnostic disable-next-line: undefined-field
  if not server:is_installed() then
    vim.notify("Installing LSP Server : " .. server_name, "info")
    ---@diagnostic disable-next-line: undefined-field
    server:install()
  else
    server_file = "language." .. server_file

    local opts_ok, opts = pcall(require, server_file)
    if not opts_ok then
      vim.notify("Get Language Config : " .. server_file .. " Failed.")
      goto continue
      return
    end

    opts.lsp.flags = {debounce_text_changes = 150}
    opts.lsp.capabilities = require("plugins.lsp.nvim-cmp").capabilities
    opts.lsp.handlers = vim.tbl_deep_extend("force", lsp_handlers, opts.lsp.handlers or {})
    require("lspconfig")[server_name].setup(opts.lsp)
  end
  ::continue::
end

vim.diagnostic.config(
  {
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = {source = "always"},
    virtual_text = {prefix = "●", source = "always"}
  }
)

local icons = require("utils.icons")

for tpe, icon in pairs(icons.diagnostics) do
  local hl = "DiagnosticSign" .. tpe
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
