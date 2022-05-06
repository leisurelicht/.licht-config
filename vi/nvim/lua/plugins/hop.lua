-- =================
-- hop.lua --- 快速跳转插件配置
-- Author: MuCheng
-- =================
--
local ok, hop = pcall(require, "hop")
if not ok then
  vim.notify("Load hop Failed", "warn")
  return
end

hop.setup()

local keys = require("utils.keys")
keys.mapKey(
  "n",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
keys.mapKey(
  "n",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)
keys.mapKey(
  "o",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
  {}
)
keys.mapKey(
  "o",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
  {}
)
keys.mapKey(
  "",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
keys.mapKey(
  "",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)

local wk = require("which-key")
wk.register(
  {
    h = {
      name = "+Hop",
      w = {"<CMD>HopWord<CR>", "Word"},
      l = {"<CMD>HopLine<CR>", "Line"},
      c = {"<CMD>HopChar1<CR>", "Char"},
      p = {"<CMD>HopPattern<CR>", "Pattern"},
      s = {"<CMD>HopLineStart<CR>", "Line Start"},
      a = {
        name = "+All Windows",
        w = {"<CMD>HopWordMW<CR>", "Word"},
        l = {"<CMD>HopLineMW<CR>", "Line"},
        c = {"<CMD>HopChar1MW<CR>", "Char"},
        p = {"<CMD>HopPatternMW<CR>", "Pattern"},
        s = {"<CMD>HopLineStartMW<CR>", "Line Start"}
      }
    }
  },
  {prefix = "<leader>"}
)
