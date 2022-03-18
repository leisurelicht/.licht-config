-- ==============
-- nvim-lspconfig.lua --- lsp config file
-- Author: MuCheng
-- =================
--
local ok, lsp = pcall(require, "lspconfig")
if not ok then
  vim.notify("Load lsp Failed", "warn")
  return
else
end

