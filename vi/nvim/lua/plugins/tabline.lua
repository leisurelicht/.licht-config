-- =================
-- tabline.lua --- tabline config file
-- Author: MuCheng
-- =================
--
local ok, tabline = pcall(require, "tabline")
if not ok then
  vim.notify("Load comment Failed", "warn")
  return
end

tabline.setup{
  options = {
    show_bufnr = true,
  }
}

