-- =================
-- nvim-treesitter.lua --- nvim-treesitter config file
-- Author: MuCheng
-- =================
--
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',

  sync_install =false,

  ignore_install = {
    'java',
  },

  highlight = {
    enable = false,
    disable = {
      "java",
    },
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },

  indent = {
    enable = true,
  }

}

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

