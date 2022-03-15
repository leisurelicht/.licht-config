-- =================
-- notify.lua --- notify config file
-- Author: MuCheng
-- =================
--
local ok, notify = pcall(require, "notify")
if not ok then
  vim.notify("Require notify Failed")
  return
end

vim.notify = notify

notify.setup({
  render = "slide",
  background_colour = "#000000",
})

