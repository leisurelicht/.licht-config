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

dapui.setup({
	sidebar = {
		position = "right",
	},
})

local dap = require("dap")
-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open(nil)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close(nil)
	dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close(nil)
	dap.repl.close(nil)
end

local map = require("utils.mapping")

map.set("n", "<leader>du", require("dapui").toggle, "UI Toggle")
map.set("n", "<leader>de", require("dapui").eval, "UI Eval")
