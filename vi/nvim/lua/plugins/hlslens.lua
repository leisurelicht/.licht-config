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

-- vim.cmd([[
--   aug VMlens
--       au!
--       au User visual_multi_start lua require("plugins.hlslens").start()
--       au User visual_multi_exit lua require("plugins.hlslens").exit()
--   aug END
-- ]])

-- local M = {}

-- local config
-- local lensBak

-- local overrideLens = function(render, posList, nearest, idx, relIdx)
--   local _ = relIdx
--   local lnum, col = unpack(posList[idx])

--   local text, chunks
--   if nearest then
--     text = ('[%d/%d]'):format(idx, #posList)
--     chunks = {{' ', 'Ignore'}, {text, 'VM_Extend'}}
--   else
--     text = ('[%d]'):format(idx)
--     chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
--   end
--   render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
-- end

-- function M.start()
--   if hlslens then
--     config = require('hlslens.config')
--     lensBak = config.override_lens
--     config.override_lens = overrideLens
--     hlslens.start(true)
--   end
-- end

-- function M.exit()
--   if hlslens then
--     config.override_lens = lensBak
--     hlslens.start(true)
--   end
-- end

-- return M

