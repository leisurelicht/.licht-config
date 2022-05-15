-- =================
-- undotree.lua --- 历史保存
-- Author: MuCheng
-- =================
--
vim.cmd([[
if has("presistent_undo")
  let target_path = expand('~/.undodir')

  echo target_path
  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(target_path)
      call mkdir(target_path, "p", 0700)
  endif
  let &undodir=target_path
  set undofile
]])

vim.g.undotree_WindowLayout = 3

local keys = require("utils.keys")
keys.mapCmd("<F6>", "UndotreeToggle")

local wk = require("which-key")
wk.register({ U = { "<CMD>UndotreeToggle<CR>", "UndoTree" } }, { prefix = "<leader>" })
