-- =================
-- symbols-outline.lua --- 代码结构树配置文件
-- Author: MuCheng
-- =================
--

local ok, outline = pcall(require, "symbols-outline")
if not ok then
  vim.notify("Require symbols-outline Failed", "warn")
  return
end

outline.setup {
  show_numbers = false,
}

local keys = require('utils.keys')
keys.mapCmd("<F5>", "SymbolsOutline")
nmap = {
  S = {
    name = "+SymbolsOutline",
    t = {"<CMD>SymbolsOutline<CR>", "Toggle"},
    o = {"<CMD>SymbolsOutlineOpen<CR>", "Open"},
    c = {"<CMD>SymbolsOutlineClose<CR>", "Close"},
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)
