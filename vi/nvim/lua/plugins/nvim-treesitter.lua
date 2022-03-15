-- =================
-- nvim-treesitter.lua --- nvim-treesitter config file
-- Author: MuCheng
-- =================
--
local ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("Require nvim-treesitter Failed", "warn")
  return
end

treesitter_config.setup {
  ensure_installed = {
    "vim",
    "bash",
    "lua",
    "python",
    "go",
    "make",
    "markdown",
    "json",
    "c",
    "gomod",
    "yaml",
    "dockerfile",
    "comment",
    "cmake",
    "http",
    "html",
  },
  ignore_install = {
    'java',
  },

  highlight = {
    enable = true,
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

nmap = {
  T = {
    name = "+TreeSitter",
    u = {"<CMD>TSUpdate all<CR>", "Update All"},
    U = {"<CMD>TSUpdate ", "Update {language}"},
    s = {"<CMD>TSModuleInfo", "Module Info"},  
  } 
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

