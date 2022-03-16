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

notify.setup({
  render = "default",
  stages = "slide",
  -- background_colour = "#000000",
})


notify("This is an error message", "debug")

-- vim.notify = notify
