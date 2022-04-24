-- =================
-- spellsitter.lua --- 拼写检查
-- Author: MuCheng
-- =================
--
local ok, spell = pcall(require, "spellsitter")
if not ok then
  vim.notify("Load spell Failed", "warn")
  return
end

spell.setup({enable = true})
