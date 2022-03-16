-- =================
-- marks.lua --- marks config file
-- Author: MuCheng
-- =================
--
local ok, marks = pcall(require, "marks")
if not ok then
  vim.notify("Require marks Failed", "warn")
  return
end

marks.setup {
  default_mappings = false,
}

nmap = {
  m = {
    name = "+Marks",
    s = {"<Plug>(Marks-set)", "Set"},
    d = {"<Plug>(Marks-delete)", "Delete Buf"},
    r = {"<Plug>(Marks-delete-bookmark)", "Delete bookmark"},
    t = {"<CMD>MarksToggleSigns<CR>", "Toggle"},


    l = {
      name = "+List",
      a = {"<CMD>MarksListAll<CR>", "All"},
      b = {"<CMD>MarksListBuffer<CR>", "Buffer"},
      g = {"<CMD>MarksListGlobal<CR>", "Global"},
    },
    q = {
      name = "+Quickfix List",
      a = {"<CMD>MarksQFListAll<CR>", "All"},
      b = {"<CMD>MarksQFListBuf<CR>", "Buffer"},
      g = {"<CMD>MarksQFListGlocal<CR>", "Global"},
    }
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)
