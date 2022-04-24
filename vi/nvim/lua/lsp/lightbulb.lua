-- ==============
-- lightbulb.lua --- 小灯泡
-- Author: MuCheng
-- =================
--
local ok, _ = pcall(require, "nvim-lightbulb")
if not ok then
  vim.notify("Load nvim-lightbulb Failed", "warn")
  return
end


vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
