-- ==============
-- nvim-lspconfig.lua --- lsp config file
-- Author: MuCheng
-- =================
--
local ok, lsp = pcall(require, "lspconfig")
if not ok then
  vim.notify("Require lsp Failed", "warn")
  return
end

require("lsp")
