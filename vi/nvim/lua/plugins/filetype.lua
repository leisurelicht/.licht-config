-- =================
-- filetype.lua --- 优化启动速度 
-- Author: MuCheng
-- =================
--
local ok, ft = pcall(require, "filetype")
if not ok then
  print("require filetype failed")
  return
end

ft.setup {}

