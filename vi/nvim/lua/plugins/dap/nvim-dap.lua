-- =================
-- nvim-dap.lua --- dap 配置
-- Author: MuCheng
-- =================
--
local ok, dap = pcall(require, "dap")
if not ok then
  vim.notify("Load dap Failed", "warn")
  return
end

local api = require("utils.api")
api.hi.set("debugger", {fg = "red"})

local dap_config = {
  python = require("language.python"),
  go = require("language.go")
}

for name, opts in pairs(dap_config) do
  dap.adapters[name] = opts.dap.adapters
  dap.configurations[name] = opts.dap.configurations
end

local wk = require("which-key")
wk.register(
  {
    d = {
      name = "+DAP",
      a = {"<CMD>lua require'dap'.toggle_breakpoint()<CR>", "Add Break Point"},
      c = {"<CMD>lua require'dap'.clear_breakpoints()<CR>", "Clear Break Point"},
      d = {"<CMD>lua require'dap'.continue()<CR>", "Continue"},
      j = {"<CMD>lua require'dap'.step_over()<CR>", "Setp Over"},
      n = {"<CMD>lua require'dap'.step_into()<CR>", "Setp Into"},
      o = {"<CMD>lua require'dap'.step_out()<CR>", "Setp Out"},
      r = {"<CMD>lua require'dap'.run_last()<CR>", "Run Last"},
      t = {"<CMD>lua require'dap'.terminate()<CR>", "Terminate"}
    }
  },
  {prefix = "<leader>"}
)
