require('symbols-outline').setup{}

local keys = require('utils.keys')
keys.map('n', '<F5>', ':SymbolsOutline<CR>', keys.opt)
-- keys.map('n', '<leader>Sn', ':SymbolsOutline<CR>', keys.opt)

