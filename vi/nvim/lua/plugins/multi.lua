-- =================
-- multi.lua --- 多光标配置
-- Author: MuCheng
-- =================
--
vim.cmd(
  [[ 
  let g:VM_maps = {}
  let g:VM_maps["Add Cursor Down"]    = '<M-j>'   " new cursor down
  let g:VM_maps["Add Cursor Up"]      = '<M-k>'   " new cursor up
]]
)

local wk = require("which-key")
wk.register(
  {
    ["tab"] = {":call b:VM_Selection.Global.change_mode(1)<cr>"}
  }
)
