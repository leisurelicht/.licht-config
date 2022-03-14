-- ================= which-key.lua --- which-key config file author: mucheng =================
--
local ok, which_key = pcall(require, "which-key")
if not ok then
  print("require which-key failed")
  return
end


which_key.setup {
  layout = {
    height = { min = 4, max = 25 },
    align = "center",
  },
}


WhichKeyMap.opts = {
  normal = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowaite = true,
  },
  visual = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowaite = true,
  },
}
WhichKeyMap.localOpts = {
  normal = {
    mode = "n",
    prefix = "<localleader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowaite = true,
  },
  visual = {
    mode = "v",
    prefix = "<localleader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowaite = true,
  },
}



nmap = {
  ["1"] = "window 1",
  ["2"] = "window 2",
  ["3"] = "window 3",
  ["4"] = "window 4",
  ["5"] = "window 5",
  ["6"] = "window 6",
  ["7"] = "window 7",
  ["8"] = "window 8",
  ["9"] = "window 9",
  s = {
    name = "+Split",
    v = "竖直分屏",
    h = "水平分屏",
    c = "Close Current Window",
    o = "Close Other Window",
  },
  t = {
    name = "+Tab",
    t = "tab",
    d = "tabdo",
    a = "New Tab",
    e = "Edit File",
    c = "Close Tab",
    b = "List Tabs",
    s = "List Tabs",
    f = "First Tab",
    l = "Last Tab",
    p = "Previous Tab",
    n = "Next Tab",
    ["1"] = "Tab 1",
    ["2"] = "Tab 2",
    ["3"] = "Tab 3",
    ["4"] = "Tab 4",
    ["5"] = "Tab 5",
    ["6"] = "Tab 6",
    ["7"] = "Tab 7",
    ["8"] = "Tab 8",
    ["9"] = "Tab 9",
    o = {
      name = "+CloseOnly",
      o = "close all tab except [tab]",
      a = "close all tab only current tab",
      ["1"] = "close all tab only 1 tab",
      ["2"] = "close all tab only 2 tab",
      ["3"] = "close all tab only 3 tab",
      ["4"] = "close all tab only 4 tab",
      ["5"] = "close all tab only 5 tab",
      ["6"] = "close all tab only 6 tab",
      ["7"] = "close all tab only 7 tab",
      ["8"] = "close all tab only 8 tab",
      ["9"] = "close all tab only 9 tab",
      ["$"] = "close all tab only last tab",
    },
  },
}

localNmap = {
  s = {
    name = "+Shift Str",
    u = "Upper Word",
    l = "Lower Word",
    o = "Upper First letter",
  }
}

tableMerge(WhichKeyMap.maps.normal, nmap)
tableMerge(WhichKeyMap.localMaps.normal, localNmap)

which_key.register(WhichKeyMap.maps.normal, WhichKeyMap.opts.normal)
which_key.register(WhichKeyMap.localMaps.normal, WhichKeyMap.localOpts.normal)



