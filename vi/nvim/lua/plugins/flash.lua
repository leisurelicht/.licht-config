return {
  {
    "folke/flash.nvim",
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "o", "x" }, false },
      { "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Jump" },
      { "<leader>J", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Jump Select" },
    },
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
  },
}
