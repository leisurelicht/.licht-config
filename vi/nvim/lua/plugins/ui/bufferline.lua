local map = require("utils.map")

return {
  {
    "tiagovla/scope.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = { restore_state = false },
    config = function(_, opts)
      require("scope").setup(opts)
      -- require("telescope").load_extension("scope")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    optional = true,
    keys = function()
      map.lazy("n", "<leader>bt", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin" })
      map.lazy("n", "<leader>bT", "<cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
      map.lazy("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
      map.lazy("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
      map.lazy("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
      map.lazy("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
      map.lazy("n", "<leader>bk", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })
      map.lazy("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" })
      map.lazy("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" })
      map.lazy("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" })
      map.lazy("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" })
      map.lazy("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" })
      map.lazy("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" })
      map.lazy("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" })
      map.lazy("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" })
      return {}
    end,
    opts = {
      options = {
        numbers = "ordinal",
        diagnostics_indicator = function(count, _, _, _)
          return count > 0 and " " or nil
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "  File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },
}
