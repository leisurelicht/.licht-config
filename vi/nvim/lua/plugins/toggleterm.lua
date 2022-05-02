-- =================
-- toggleterm.lua --- 浮窗终端
-- Author: MuCheng
-- =================
--
local ok, term = pcall(require, "toggleterm")
if not ok then
  vim.notify("Load toggleterm Failed")
  return
end

term.setup {
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "double", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  }
}

local keys = require("utils.keys")
keys.mapKey("n", "<C-T>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>")
keys.mapKey("i", "<C-T>", "<ESC><CMD>exe v:count1 . 'ToggleTerm'<CR>")

local wk = require("which-key")
wk.register(
  {
    e = {
      name = "+Term",
      t = {"<CMD>ToggleTerm<CR>", "Toggle"}
    }
  },
  {prefix = "<leader>"}
)
