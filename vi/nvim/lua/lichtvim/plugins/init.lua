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
  -- {"MunifTanjim/nui.nvim", lazy = true},
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
    "rcarriga/nvim-notify",
    opts = {
      level = "info",
      render = "default",
      stages = "slide",
      background_colour = "#000000"
    },
    init = function()
      vim.notify = require("notify")
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      layout = {height = {min = 4, max = 20}, align = "center"},
      icons = {breadcrumb = "»", separator = "➜", group = "+"},
      plugins = {spelling = true}
    },
    config = function(_, opts)
      wk = require("which-key")
      wk.setup(opts)
      wk.register(
        {
          mode = "n",
          prefix = "<leader>",
          b = "Buffer",
          w = "Window",
          s = "Shift",
          t = "Tab",
          to = "Close Only"
        }
      )
    end
  },
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
    "norcalli/nvim-colorizer.lua",
    event = {"BufNewFile", "BufRead"}
  }, -- 颜色显示
  {
    "andymass/vim-matchup",
    event = {"BufNewFile", "BufRead"},
    init = function()
      vim.g.matchup_matchparen_offscreen = {method = "poopup"}
    end
  },
  {
    "itchyny/vim-cursorword",
    event = {"BufNewFile", "BufRead"}
  }, -- 标注所有光标所在单词
  {
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufNewFile", "BufRead"},
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      filetype_exclude = {
        "alpha",
        "lazy",
        "terminal",
        "help",
        "log",
        "markdown",
        "TelescopePrompt",
        "mason",
        "toggleterm"
      }
    }
  } -- 缩进标识线
}
