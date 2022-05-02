-- ==============
-- lsp-config.lua --- lsp config file
-- Author: MuCheng
-- =================
--
local ok, _ = pcall(require, "lspconfig")
if not ok then
  vim.notify("Load nvim-lspconfig Failed", "warn")
  return
end

vim.diagnostic.config({
  virtual_text = {prefix = "●", source = "always"},
  float = {source = "always"}
})
