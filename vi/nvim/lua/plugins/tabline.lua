-- =================
-- tabline.lua --- tabline config file
-- Author: MuCheng
-- =================
--
local ok, tabline = pcall(require, "tabline")
if not ok then
  print("require comment failed")
  return
end

tabline.setup{
  options = {
    show_bufnr = true,
  }
}

