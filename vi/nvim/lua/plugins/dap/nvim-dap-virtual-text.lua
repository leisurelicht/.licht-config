-- =================
-- nvim-dap-virtual-text.lua --- dap 文本配置
-- Author: MuCheng
-- =================
--
local ok, dap = pcall(require, "nvim-dap-virtual-text")
if not ok then
  vim.notify("Load nvim-dap-virtual-text Failed", "warn")
  return
end

dap.setup()
