-- =================
-- bufferline.lua --- bufferline config file
-- Author: MuCheng
-- =================
--
local ok, bufferline = pcall(require, "bufferline")
if not ok then
  print("require comment failed")
  return
end

vim.opt.termguicolors = true
bufferline.setup{
  options = {
    numbers = function(opts)
      return string.format('%s.%s', opts.ordinal, opts.lower(opts.id))
    end,
    -- 使用 nvim 内置 lsp
    diagnostics = 'nvim_lsp',
    -- 左侧让出nvim-tree的位置
    offsets = {{
      filetype = 'NvimTree',
      text = 'File Explorer',
      highlight = 'Directory',
      text_align = 'left',
    }},
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and "  "
          or (e == "warning" and "  " or " ")
        s = s .. n .. sym
      end
      return s
    end
  }
}

local keys_ok, keys = pcall(require, "utils.keys")
if not keys_ok then
  return
end


local keys = require('utils.keys')

keys.mapCmd('<A-h>',':BufferLineCyclePrev<CR>')
keys.mapCmd('<A-l>',':BufferLineCycleNext<CR>')

keys.mapCmd('<A-<>',':BufferLineMovePrev<CR>')
keys.mapCmd('<A->>',':BufferLineMoveNext<CR>')

nmaps = {
  b = {
    name = "+Buffer",
    ["1"] = {"<CMD>BufferLineGoToBuffer 1<CR>", "Buffer 1"},
    ["2"] = {"<CMD>BufferLineGoToBuffer 2<CR>", "Buffer 2"},
    ["3"] = {"<CMD>BufferLineGoToBuffer 3<CR>", "Buffer 3"},
    ["4"] = {"<CMD>BufferLineGoToBuffer 4<CR>", "Buffer 4"},
    ["5"] = {"<CMD>BufferLineGoToBuffer 5<CR>", "Buffer 5"},
    ["6"] = {"<CMD>BufferLineGoToBuffer 6<CR>", "Buffer 6"},
    ["7"] = {"<CMD>BufferLineGoToBuffer 7<CR>", "Buffer 7"},
    ["8"] = {"<CMD>BufferLineGoToBuffer 8<CR>", "Buffer 8"},
    ["9"] = {"<CMD>BufferLineGoToBuffer 9<CR>", "Buffer 9"},
    p = {"<CMD>BufferLinePick<CR>", "Buffer Pick"},
    c = {"<CMD>BufferLinePickClose<CR>", "Buffer Pick Close"},
    t = {"<CMD>BufferSortByTabs<CR>", "Sort By Tabs"},
    d = {"<CMD>BufferSortByDirecory<CR>", "Sort By Direcory"},
    e = {"<CMD>BufferLineSortByExtension<CR>", "Sort By Extension"},
    r = {"<CMD>BufferLineSortByRelativeDirectory<CR>", "Sort By RelativeDirectory "},
  }
}

tableMerge(WhichKeysMap.maps.normal, nmaps)
