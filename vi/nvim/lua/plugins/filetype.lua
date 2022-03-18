-- =================
-- filetype.lua --- 优化启动速度 
-- Author: MuCheng
-- =================
--
local ok, ft = pcall(require, "filetype")
if not ok then
  vim.notify("Load filetype Failed", "warn")
  return
end

ft.setup {}

