-- =================
-- git.lua --- git 插件配置
-- Author: MuCheng
-- =================
--
-- 默认关闭 git blame
vim.g.gitblame_enabled = 0

local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  vim.notify("Load gitsigns Failed", "warn")
end

gitsigns.setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '!', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },

}


local nmap = {
  g = {
    name = "+Git",
    b = {
      name = "+Blame",
      t = {"<CMD>GitBlameToggle<CR>", "Toggle"},
      e = {"<CMD>GitBlameEnable<CR>", "Enable"},
      d = {"<CMD>GitBlameDisable<CR>", "Disable"},
      c = {"<CMD>GitBlameCopySHA<CR>", "Copy SHA"},
      u = {"<CMD>GitBlameOpenCommitURL<CR>", "Open URL"}
    },
    a = {"<CMD>Gitsigns stage_hunk<CR>", "Add Code Hunk"},
    r = {"<CMD>Gitsigns reset_hunk<CR>", "Reset Code Hunk"},
    A = {"<CMD>Gitsigns stage_buffer<CR>", "Add Code Buffer"},
    R = {"<CMD>Gitsigns reset_buffer<CR>", "Reset Codef Buffer"},
    -- TODO gitsigns 快捷键

    -- g = {"<CMD>Git<CR>", "Status"},
    -- c = {"<CMD>Git commit<CR>", "Commit"},
    -- h = {"<CMD>Git push<CR>", "Push"},
    -- l = {"<CMD>Git pull<CR>", "Pull"},
    -- e = {"<CMD>Gedit<CR>", "Edit"},
    -- r = {"<CMD>Gread<CR>", "Read"},
    -- f = {"<CMD>Gdiff<CR>", "Diff"},
    -- d = {"<CMD>GDelete<CR>", "Delete"}
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)

