-- =================
-- bufferline.lua --- bufferline config file
-- Author: MuCheng
-- =================
--
vim.opt.termguicolors = true
require('bufferline').setup{
  options = {
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

local keys = require('utils.keys')
keys.map('n', '<A-h>',':BufferLineCyclePrev<CR>', key.opt)
keys.map('n', '<A-l>',':BufferLineCycleNext<CR>', key.opt)
