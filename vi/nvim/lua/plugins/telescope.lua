local Util = require("lazyvim.util")
local actions = require("telescope.actions")
local themes = require("telescope.themes")
local trouble = require("trouble.providers.telescope")
local map = require("utils.map")

return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    keys = function(_, keys)
      local _keys = {
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

        { "<leader>fo", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
        { "<leader>fO", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },

        { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sC", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      }
      keys = vim.list_extend(keys, _keys)

      map.lazy("n", "<leader>bs", "<cmd>Telescope buffers<cr>", "Buffers")

      return keys
    end,
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
      pickers = {
        find_files = { theme = "dropdown" },
        git_files = { theme = "dropdown" },
        oldfiles = themes.get_dropdown({ previewer = false }),
        buffers = themes.get_dropdown({ previewer = false }),
        command_history = { theme = "dropdown" },
        search_history = { theme = "dropdown" },
        live_grep = {
          prompt_title = "Text Search",
          preview_title = "Text Preview",
          disable_coordinates = true,
          path_display = { "tail" },
        },
        grep_string = {
          preview_title = "Word Preview",
          disable_coordinates = true,
          word_match = "-w",
          path_display = { "tail" },
          only_sort_text = true,
        },
        treesitter = { theme = "ivy" },
        marks = { theme = "ivy" },
        git_commits = { theme = "ivy" },
        git_bcommits = { theme = "ivy" },
        git_branches = { theme = "ivy" },
        git_status = { theme = "ivy" },
        git_stash = { theme = "ivy" },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      if require("lazyvim.util").has("nvim-notify") then
        telescope.load_extension("notify")
        map.set("n", "<leader>sn", "<cmd>Telescope notify theme=dropdown<cr>", "Notify")
      end
    end,
  },
}
