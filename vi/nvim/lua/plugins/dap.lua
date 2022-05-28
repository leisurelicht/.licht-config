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
api.hi.set("debugger", { fg = "red" })

local dap_config = {
    "python",
    "go"
}

for _, name in ipairs(dap_config) do
    local dap_file = "config.dap." .. name
    local opts_ok, opts = pcall(require, dap_file)
    if not opts_ok then
        vim.notify("Get DAP Config : " .. dap_file .. " Failed.", "Warn")
        goto continue
    end

    dap.adapters[opts.names.adapters] = opts.adapters
    dap.configurations[opts.names.configurations] = opts.configurations

    ::continue::
end

local map = require("utils.mapping")

map.set("n", "<leader>da", require 'dap'.toggle_breakpoint, "Add Break Point")
map.set("n", "<leader>dc", require 'dap'.clear_breakpoints, "Clear Break Point")
map.set("n", "<leader>dd", require 'dap'.continue, "Continue")
map.set("n", "<leader>dj", require 'dap'.step_over, "Setp Over")
map.set("n", "<leader>dn", require 'dap'.step_into, "Setp Into")
map.set("n", "<leader>do", require 'dap'.step_out, "Setp Out")
map.set("n", "<leader>dr", require 'dap'.run_last, "Run Last")
map.set("n", "<leader>dt", require 'dap'.terminate, "Terminate")
