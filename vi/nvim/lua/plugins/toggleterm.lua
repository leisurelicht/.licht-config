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
  direction = 'float',
}

local keys = require('utils.keys')
keys.mapKey("n", "<C-T>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>")
keys.mapKey("i", "<C-T>", "<ESC><CMD>exe v:count1 . 'ToggleTerm'<CR>")

nmap = {
  e = {
    name = "+Term",
    t = {"<CMD>ToggleTerm<CR>", "Toggle"},  
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)
   
