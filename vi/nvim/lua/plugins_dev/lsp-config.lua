

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local ok, _ = pcall(require, "lspconfig")
if not ok then
  vim.notify("Load nvim-lspconfig Failed", "warn")
  return
end

vim.diagnostic.config({
  virtual_text = {prefix = "●", source = "always"},
  float = {source = "always"}
})
