-- =================
-- marks.lua --- marks config file
-- Author: MuCheng
-- =================
--
local ok, marks = pcall(require, "marks")
if not ok then
  print("require marks failed")
  return
end

marks.setup {}

nmap = {
  m = {
    name = "+Marks",
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
