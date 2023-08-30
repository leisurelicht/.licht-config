local Util = require("lazyvim.util")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- disable the keymap to grep files
      { "<leader><space>", false },
      { "<leader>/", false },
      { "<leader>,", false },
      { "<leader>:", false },
      { "<leader>fn", false },
      { "<leader>bs", false },
      { "<leader>fr", false },
      { "<leader>fR", false },
      { "<leader>fR", false },

      {
        "<leader>fo",
        Util.telescope("oldfiles", { cwd = vim.loop.cwd() }),
        desc = "Recent (cwd)",
      },
      { "<leader>fO", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>bs", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = { horizontal = { prompt_position = "top" } },
        history = { path = vim.fn.stdpath("data") .. "/telescope/history" },
        mappings = {
          i = {
            ["<ESC>"] = actions.close,
            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-h>"] = actions.cycle_history_prev,
            ["<C-l>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-t>"] = trouble.open_with_trouble,
          },
          n = {
            ["<ESC>"] = actions.close,
            ["<C-t>"] = trouble.open_with_trouble,
          },
        },
      },
    },
  },
}
