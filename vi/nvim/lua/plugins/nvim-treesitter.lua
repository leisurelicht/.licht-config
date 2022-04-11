-- =================
-- nvim-treesitter.lua --- nvim-treesitter config file
-- Author: MuCheng
-- =================
--
local ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("Load nvim-treesitter Failed", "warn")
  return
end

treesitter_config.setup {
  ensure_installed = {
    "vim", "bash", "lua", "go", "make", "markdown", "json", "c", "gomod",
    "yaml", "dockerfile", "comment", "cmake", "http", "html", "python"
  },
  ignore_install = {'java'},

  highlight = {enable = true, additional_vim_regex_highlighting = false},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<leader>hn',
      node_incremental = '<leader>hr',
      node_decremental = '<leader>hc',
      scope_incremental = '<leader>hm'
    }
  },

  indent = {enable = true, disable = {"python"}}

}

local wk = require("which-key")

wk.register({
  h = {
    name = "+代码高亮",
    n = {"Selection"},
    r = {"Incremental"},
    c = {"Decremental"},
    m = {"Scope Incremental"},
    U = {"<CMD>TSUpdate all<CR>", "Update All"},
    S = {"<CMD>TSModuleInfo<CR>", "Module Info"}
  }
}, {prefix = "<leader>"})

wk.register({
  h = {
    name = "+代码高亮",
    n = {"Selection"},
    r = {"Incremental"},
    c = {"decremental"},
    m = {"Scope Incremental"},
  }
}, {mode = "v", prefix = "<leader>"})


-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

