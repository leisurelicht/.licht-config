-- =================
-- indent-blankline.lua --- indent-blankline
-- Author: MuCheng
-- =================
--
local ok, indent = pcall(require, "indent_blankline")
if not ok then
  vim.notify("Load indent-blankline Failed", "warn")
  return
end

indent.setup {
  show_end_of_line = true,
}
