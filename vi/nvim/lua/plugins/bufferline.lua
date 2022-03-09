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
keys.map('n', '<A-h>',':BufferLineCyclePrev<CR>', key.opt)
keys.map('n', '<A-l>',':BufferLineCycleNext<CR>', key.opt)

keys.map('n', '<A-<>',':BufferLineMovePrev<CR>', key.opt)
keys.map('n', '<A->>',':BufferLineMoveNext<CR>', key.opt)


keys.map('n', '<leader>b1',':BufferLineGoToBuffer 1<CR>', key.opt)
keys.map('n', '<leader>b2',':BufferLineGoToBuffer 2<CR>', key.opt)
keys.map('n', '<leader>b3',':BufferLineGoToBuffer 3<CR>', key.opt)
keys.map('n', '<leader>b4',':BufferLineGoToBuffer 4<CR>', key.opt)
keys.map('n', '<leader>b5',':BufferLineGoToBuffer 5<CR>', key.opt)
keys.map('n', '<leader>b6',':BufferLineGoToBuffer 6<CR>', key.opt)
keys.map('n', '<leader>b7',':BufferLineGoToBuffer 7<CR>', key.opt)
keys.map('n', '<leader>b8',':BufferLineGoToBuffer 8<CR>', key.opt)
keys.map('n', '<leader>b9',':BufferLineGoToBuffer 9<CR>', key.opt)

keys.map('n', '<leader>bp',':BufferLinePick<CR>', key.opt)
keys.map('n', '<leader>bc',':BufferLinePickClose<CR>', key.opt)

keys.map('n', '<leader>bt',':BufferLineSortByTabs<CR>', key.opt)
keys.map('n', '<leader>bd',':BufferLineSortByDirecory<CR>', key.opt)
keys.map('n', '<leader>be',':BufferLineSortByExtension<CR>', key.opt)
keys.map('n', '<leader>br',':BufferLineSortByRelativeDirectory<CR>', key.opt)

