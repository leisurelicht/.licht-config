local utils = require("utils")
local map = require("utils.map")
local Util = require("lazy.core.util")

return {
  { import = "plugins.editor.telescope" },
  -- { import = "plugins.editor.toggleterm" },
  {
    "RRethy/nvim-treesitter-endwise",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      optional = true,
      opts = function(_, opts)
        opts.endwise = { enable = true }
      end,
    },
  },
  { "nacro90/numb.nvim", event = { "BufRead", "BufNewFile" }, config = true },
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
    keys = { { "<leader>uo", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" } },
  },
  {
    "folke/flash.nvim",
    optional = true,
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "o", "x" }, false },
      { "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Jump To" },
      { "<leader>J", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Quick Select" },
    },
    opts = { modes = { char = { jump_labels = true } } },
  },
  {
    "mrjones2014/smart-splits.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "prompt", "alpha", "neo-tree", "toggleterm" },
      ignored_buftypes = { "nofile", "NvimTree", "terminal" },
      move_cursor_same_row = false,
      resize_mode = {
        silent = true,
        hooks = {
          on_enter = function()
            Util.info("Entering Resize Mode. Welcome")
          end,
          on_leave = function()
            Util.info("Exiting Resize Mode. Bye")
          end,
        },
      },
    },
    config = function(_, opts)
      require("smart-splits").setup(opts)
      map.lazy("n", "<leader>us", function()
        require("smart-splits").start_resize_mode()
      end, { desc = "Enable resize mode" })
      map.lazy("n", "<leader>uS", "<cmd>tabdo wincmd =<cr>", { desc = "Resume size" })
    end,
  },
  {
    "brglng/vim-im-select",
    event = { "BufRead", "BufNewFile" },
    keys = {
      {
        "<leader>uI",
        function()
          local autocommand = vim.api.nvim_get_autocmds({ group = "im_select" })
          if #autocommand == 0 then
            vim.cmd([[ImSelectEnable]])
            Util.info("Enabled im select")
          else
            vim.cmd([[ImSelectDisable]])
            Util.info("Disabled im select")
          end
        end,
        desc = "Toggle imselect",
      },
    },
    init = function()
      vim.g.im_select_enable_focus_events = 1
      if utils.sys.is_macos() or utils.sys.is_linux() then
        vim.api.nvim_create_autocmd({ "TermEnter" }, {
          group = vim.api.nvim_create_augroup("im_select", { clear = true }),
          pattern = { "*" },
          command = "call system('im-select com.apple.keylayout.ABC')",
        })
      end
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
        version = "v2.*",
        event = "VeryLazy",
        opts = {
          hint = "floating-big-letter",
          selection_chars = "ABFJDKSL;CMRUEIWOQP",
          show_prompt = false,
          filter_rules = {
            bo = {
              filetype = { "neo-tree", "neo-tree-popup", "notify", "noice", "aerial" },
              buftype = { "terminal", "quickfix" },
            },
          },
        },
      },
    },
    opts = function(_, opts)
      opts.close_if_last_window = true
      opts.source_selector = { winbar = true, content_layout = "center" }
      opts.window.mappings.S = "none"
      opts.window.mappings.o = "split_with_window_picker"
      opts.window.mappings.s = "vsplit_with_window_picker"
      opts.window.mappings["<cr>"] = "open_with_window_picker"
      opts.window.mappings["<tab>"] = { "toggle_preview", config = { use_float = true } }
      -- opts.window.mappings["<esc>"] = "close_window"
    end,
  },
}
