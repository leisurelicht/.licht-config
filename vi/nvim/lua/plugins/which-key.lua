-- =================
-- which-key.lua --- which-key config file
-- author: mucheng
-- =================
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

WhichKeysMap = {}

WhichKeysMap.opts = {
  n = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowaite = true,
  },
  v = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowaite = true,
  },
}



WhichKeysMap.maps = {
  n = {
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
      c = "close current window",
      o = "close other window",
    },
    t = {
      name = "+Tab",
      t = "tab",
      d = "tabdo",
      a = "new tab",
      e = "edit file",
      c = "close tab",
      b = "list tabs",
      s = "list tabs",
      f = "first tab",
      l = "last tab",
      p = "previous tab",
      n = "next tab",
      ["1"] = "tab 1",
      ["2"] = "tab 2",
      ["3"] = "tab 3",
      ["4"] = "tab 4",
      ["5"] = "tab 5",
      ["6"] = "tab 6",
      ["7"] = "tab 7",
      ["8"] = "tab 8",
      ["9"] = "tab 9",
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
}


which_key.register(WhichKeysMap.maps.n, WhichKeysMap.opts.n)

