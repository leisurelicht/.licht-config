-- =================
-- notify.lua --- notify config file
-- Author: MuCheng
-- =================
--
local ok, notify = pcall(require, "notify")
if not ok then
  vim.notify("Load notify Failed")
  return
end

notify.setup({
  level = "info",
  render = "default",
  stages = "slide",
  background_colour = "#000000"
})

vim.notify = notify
