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

-- dap.setup({})

local dap_config = {
  -- python = require("language.python")
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
      t = {"<CMD>lua require'dap'.toggle_breakpoint()<CR>", "Break Point"},
      d = {"<CMD>lua require'dap'.continue()<CR>", "Continue"},
      j = {"<CMD>lua require'dap'.setup_over()<CR>", "Setp Over"},
      n = {"<CMD>lua require'dap'.setup_into()<CR>", "Setp Into"},
      o = {"<CMD>lua require'dap'.setup_out()<CR>", "Setp Out"},
      r = {"<CMD>lua require'dap'.run_last()<CR>", "Run Last"},
      c = {
        "<CMD>lua require'dap'.close()<CR>" ..
          "<CMD>lua require'dap.repl'.close<CR>" ..
            "<CMD>lua require'dapui.close()<CR><CMD>DapVirtualTextForceRefresh<CR>",
        "Close"
      }
    }
  },
  {prefix = "<leader>"}
)
