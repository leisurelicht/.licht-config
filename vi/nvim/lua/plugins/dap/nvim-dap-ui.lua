-- =================
-- nvim-dap-ui.lua --- dap ui 配置
-- Author: MuCheng
-- =================
--
local ok, dapui = pcall(require, "dapui")
if not ok then
  vim.notify("Load dap-ui Failed", "warn")
  return
end

dapui.setup(
  {
    sidebar = {
      position = "right"
    }
  }
)

local dap = require("dap")
-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  dap.repl.close()
end

local wk = require("which-key")
wk.register(
  {
    ["du"] = {"<CMD>lua require'dapui'.toggle()<CR>", "UI Toggle"},
    ["de"] = {"<CMD>lua require'dapui'.eval()<CR>", "UI Eval"}
  },
  {prefix = "<leader>"}
)
