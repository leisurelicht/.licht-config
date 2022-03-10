-- =================
-- which-key.lua --- which-key config file
-- Author: MuCheng
-- =================
--
local ok, which_key = pcall(require, "which-key")
if not ok then
  print("require which-key failed")
  return
end


which_key.setup {}
