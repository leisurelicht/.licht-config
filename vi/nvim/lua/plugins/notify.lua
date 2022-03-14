-- =================
-- notify.lua --- notify config file
-- Author: MuCheng
-- =================
--
local ok, notify = pcall(require, "notify")
if not ok then
  print("require notify failed")
  return
end

vim.notify = notify

notify.setup({
  background_colour = "#000000"
})

