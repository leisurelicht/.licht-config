-- =================
-- nvim-autopairs.lua --- autopairs config file
-- Author: MuCheng
-- =================
--
require('nvim-autopairs').setup{}
local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  vim.notify("Load autopairs Failed", "warn")
  return
end

autopairs.setup {
  -- disable_filetype = {
  --   -- "TelescopePrompt",
  -- },
}

-- -- If you want insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))