-- =================
-- hlslens.lua --- 搜索结果统计插件配置
-- Author: MuCheng
-- =================
--
local ok, _ = pcall(require, "hlslens")
if not ok then
  vim.notify("Load hlslens Failed", "warn")
  return
end

local wk = require("which-key")
wk.register({
  n = {
    "[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]]"
  },
  N = {
    "[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]]"
  },
  ["*"] = {"[[*<Cmd>lua require('hlslens').start()<CR>]]", "Search Forward"},
  ["#"] = {"[[#<Cmd>lua require('hlslens').start()<CR>]]", "Search Backward"},
  ["g*"] = {
    "[[g*<Cmd>lua require('hlslens').start()<CR>]]", "Weak Search Forward"
  },
  ["g#"] = {
    "[[g#<Cmd>lua require('hlslens').start()<CR>]]", "Weak Search Backward"
  }
})
