-- =================
-- git.lua --- git 插件配置
-- Author: MuCheng
-- =================
--

-- 默认关闭 git blame
vim.g.gitblame_enabled = 0

local nmap = {
  g = {
    name = "+Git",
    b = {
      name = "+Blame",
      t = {"<CMD>GitBlameToggle<CR>", "Toggle"},
      e = {"<CMD>GitBlameEnable<CR>", "Enable"},
      d = {"<CMD>GitBlameDisable<CR>", "Disable"},
      c = {"<CMD>GitBlameCopySHA<CR>", "Copy SHA"},
      u = {"<CMD>GitBlameOpenCommitURL<CR>", "Open URL"},
    },
    g = {"<CMD>Git<CR>", "Status"},
    c = {"<CMD>Git commit<CR>", "Commit"},
    h = {"<CMD>Git push<CR>", "Push"},
    l = {"<CMD>Git pull<CR>", "Pull"},
    e = {"<CMD>Gedit<CR>", "Edit"},
    r = {"<CMD>Gread<CR>", "Read"},
    f = {"<CMD>Gdiff<CR>", "Diff"},
    d = {"<CMD>GDelete<CR>", "Delete"},
  },
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)

