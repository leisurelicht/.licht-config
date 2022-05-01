-- =================
-- nvim-autopairs.lua --- autopairs config file
-- Author: MuCheng
-- =================
--
local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  vim.notify("Load autopairs Failed", "warn")
  return
end

autopairs.setup {}
