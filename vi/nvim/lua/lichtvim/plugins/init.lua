-- =================
-- init.lua
-- =================
--
return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
    cmd = {"PlenaryBustedFile", "PlenaryBustedDirectory"}
  },
  {"nvim-tree/nvim-web-devicons", lazy = true}, -- 图标
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold"
        }
      }
    },
    config = function()
      vim.cmd("colorscheme nightfox")
    end
  }, -- 主题
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = false,
      ignored_next_char = "[%w%.]"
    }
  }, -- 自动配对
  {
    "tpope/vim-surround",
    event = "InsertEnter"
  }, -- 快速修改
  {
    "vim-scripts/indentpython.vim",
    ft = {"python", "djangohtml"}
  }, -- python indent
  {
    "norcalli/nvim-colorizer.lua"
  }, -- 颜色显示
  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen = {method = "poopup"}
    end
  },
  {"xiyaowong/nvim-cursorword"} -- 标注所有光标所在单词

  -- {
  --   "numToStr/Comment.nvim",
  --   config = function()
  --     require("plugins.comment")
  --   end
  --   -- keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
  --   -- event = "User FileOpened",
  -- }
  -- {
  --   "p00f/nvim-ts-rainbow",
  --   event = "BufEnter"
  --   dependienson = treesitter
  -- }, -- 彩虹括号
}
