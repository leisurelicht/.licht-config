local map = require("utils.map")
local Util = require("lazy.core.util")

return {
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
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
      end, "Enable resize mode")
      map.lazy("n", "<leader>uS", "<cmd>tabdo wincmd =<cr>", "Resume size")
    end,
  },
}
