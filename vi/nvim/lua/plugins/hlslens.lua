-- =================
-- hlslens.lua --- 搜索结果统计插件配置
-- Author: MuCheng
-- =================
--
local ok, hlslens = pcall(require, "hlslens")
if not ok then
  vim.notify("Load hlslens Failed", "warn")
  return
end

-- local keys = require("utils.keys")
-- keys.mapKey("n", "n",
--             [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
-- keys.mapKey("n", "N",
--             [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])

local wk = require("which-key")
wk.register({
  n = {
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    "Next"
  },
  N = {
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    "Previous"
  },
  ["*"] = {[[*<Cmd>lua require('hlslens').start()<CR>]], "Forward Search"},
  ["#"] = {[[#<Cmd>lua require('hlslens').start()<CR>]], "Backward Search"},
  ["g*"] = {
    [[g*<Cmd>lua require('hlslens').start()<CR>]], "Weak Forward Search"
  },
  ["g#"] = {
    [[g#<Cmd>lua require('hlslens').start()<CR>]], "Weak Backward Search"
  }
})
