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

  -- 关闭缩进，bug太多
  indent = {enable = false, disable = {"python"}},

  -- 彩虹括号
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }

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
    m = {"Scope Incremental"}
  }
}, {mode = "v", prefix = "<leader>"})

