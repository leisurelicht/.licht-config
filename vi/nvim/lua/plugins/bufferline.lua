-- =================
-- bufferline.lua --- bufferline config file
-- Author: MuCheng
-- =================
--
local ok, bufferline = pcall(require, "bufferline")
if not ok then
  vim.notify("Load bufferline Failed", "warn")
  return
end

vim.opt.termguicolors = true
bufferline.setup {
  options = {
    numbers = function(opts)
      return string.format('%s.%s', opts.ordinal, opts.lower(opts.id))
    end,

    -- 左侧让出nvim-tree的位置
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left'
      }
    },

    -- 使用 nvim 内置 lsp
    diagnostics = 'nvim_lsp',
    -- 显示 LSP 报错图标
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and "  " or (e == "warning" and "  " or " ")
        s = s .. n .. sym
      end
      return s
    end
  }
}

local keys = require('utils.keys')
keys.mapCmd('<A-h>', ':BufferLineCyclePrev<CR>')
keys.mapCmd('<A-l>', ':BufferLineCycleNext<CR>')
-- keys.mapCmd('<A-<>',':BufferLineMovePrev<CR>')
-- keys.mapCmd('<A->>',':BufferLineMoveNext<CR>')

local wk = require("which-key")
wk.register({
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
    [","] = {"<CMD>BufferLineMovePrev<CR>", "Move Buffer Previous"},
    ["."] = {"<CMD>BufferLineMoveNext<CR>", "Move Buffer Next"},
    n = {"<CMD>BufferLineCycleNext<CR>", "Next Buffer"},
    p = {"<CMD>BufferLineCycleNext<CR>", "Next Buffer"},
    k = {"<CMD>BufferLinePick<CR>", "Buffer Pick"},
    c = {
      name = "+Close",
      c = {"<CMD>Bdelete!<CR>", "Current Buffer"},
      p = {"<CMD>BufferLinePickClose<CR>", "Pick Buffer"},
      l = {"<CMD>BufferLineCloseLeft<CR>", "Left Buffer"},
      r = {"<CMD>BufferLineCloseRight<CR>", "Right Buffer"}
    },
    s = {
      name = "+Sort",
      t = {"<CMD>BufferSortByTabs<CR>", "Sort By Tabs"},
      d = {"<CMD>BufferSortByDirecory<CR>", "Sort By Direcory"},
      e = {"<CMD>BufferLineSortByExtension<CR>", "Sort By Extension"},
      r = {
        "<CMD>BufferLineSortByRelativeDirectory<CR>",
        "Sort By RelativeDirectory "
      }

    }
  }
}, {prefix = "<leader>"})

