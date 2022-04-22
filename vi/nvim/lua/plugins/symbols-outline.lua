-- =================
-- symbols-outline.lua --- 代码结构树配置文件
-- Author: MuCheng
-- =================
--
local ok, outline = pcall(require, "symbols-outline")
if not ok then
  vim.notify("Load symbols-outline Failed", "warn")
  return
end

outline.setup {show_numbers = false}

local keys = require('utils.keys')

keys.mapCmd("<F5>", "SymbolsOutline")

local wk = require("which-key")

wk.register({
  S = {
    name = "+代码结构树",
    t = {"<CMD>SymbolsOutline<CR>", "Toggle"},
    o = {"<CMD>SymbolsOutlineOpen<CR>", "Open"},
    c = {"<CMD>SymbolsOutlineClose<CR>", "Close"}
  }
}, {prefix = "<leader>"})
