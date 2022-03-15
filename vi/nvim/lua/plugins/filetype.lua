-- =================
-- filetype.lua --- 优化启动速度 
-- Author: MuCheng
-- =================
--
local ok, ft = pcall(require, "filetype")
if not ok then
  vim.notify("Require filetype Failed", "warn")
  return
end

ft.setup {}

