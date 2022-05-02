-- =================
-- vim-im-select.lua --- 输入法自动切换
-- Author: MuCheng
-- =================
--
vim.g.im_select_enable_focus_eventsF = 1
-- vim.g.im_select_default = "com.apple.keylayout.ABC"

local api = require("utils.api")
api.autocmd(
  {"InsertLeave"},
  {
    pattern = {"*"},
    command = "call system('im-select com.apple.keylayout.ABC')"
  }
)
api.autocmd(
  {"CmdlineLeave"},
  {
    pattern = {"*"},
    command = "call system('im-select com.apple.keylayout.ABC')"
  }
)
api.autocmd(
  {"VimEnter"},
  {
    pattern = {"*"},
    command = "call system('im-select com.apple.keylayout.ABC')"
  }
)

local wk = require("which-key")
wk.register(
  {
    I = {
      name = "+ImSelect",
      e = {"<CMD>ImSelectEnable<CR>", "Im Select Enable"},
      d = {"<CMD>ImSelectDisable<CR>", "Im Select Disable"}
    }
  },
  {prefix = "<leader>"}
)